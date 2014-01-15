class FrontendController < ApplicationController

  before_filter :determine_page, :collect_main_nav_items,
                :collect_pages_nav_columns, :collect_social_links

  add_breadcrumb "Home", :root_path

  protected

  def determine_page
    @page = nil
    # try to find page for current url
    if path_match = request.fullpath.match(/\/?([^\?]*)\??/)
      @page = ContentPage.find_by_path path_match[1]
    end
    @seo_carrier = @page
  end

  # cart functional
  CART_PRODUCTS_DELIM = '&'
  CART_COUNT_DELIM = 'c'

  def add_product_to_cart(product, absolutely_new_product)
    cookies[:sweetcart] = "" unless cookies[:sweetcart]
    products_in_da_cart = cookies[:sweetcart].split CART_PRODUCTS_DELIM
    found_in_cart = false
    unless absolutely_new_product
      products_in_da_cart.each_index do |indx|
        prindc = products_in_da_cart[indx].split(CART_COUNT_DELIM)
        if prindc[0] == product.id
          found_in_cart = true
          new_count = (prindc[0].to_i + 1).to_s
          products_in_da_cart[indx] = prindc[0] + CART_COUNT_DELIM + new_count
          break
        end
      end
    end
    unless found_in_cart
      products_in_da_cart << "#{product.id}#{CART_COUNT_DELIM}1"
    end
    cookies[:sweetcart] = products_in_da_cart.join CART_PRODUCTS_DELIM
  end

  def get_products_of_cart
    cart_items = []
    if cookies[:sweetcart]
      ids = []
      counts_by_id = []

      cookies[:sweetcart].split(CART_PRODUCTS_DELIM).each do |prindcstr|
        prindc = prindcstr.split CART_COUNT_DELIM
        prindc_id = prindc[0].to_i
        ids << prindc_id
        counts_by_id[prindc_id] = prindc[1]
      end

      Product.where(id: ids).each do |found_product|
        found_product.count = counts_by_id[found_product.id];
        cart_items << found_product
      end
    end
    return cart_items
  end

  def clear_all_products_in_cart
    cookies[:sweetcart] = ""
  end
  # end of cart functional

  def seo
    @seo ||= Seo::Basic.new @seo_carrier, false
  end

  def page_breadcrumbs
    brcs = nil
    if @page
      brcs = []
      @page.path.each do |page|
        brcs << [page.title, page.page_path]
      end
    end
    brcs
  end

  helper_method :seo, :page_breadcrumbs

  private

  def collect_main_nav_items
    @main_nav_items = MainNavItem.visibles
    
    @active_main_nav_item = nil
    @main_nav_items.each do |mni|
      if /^#{mni.url}/.match request.path
        if @active_main_nav_item
          if mni.url.length > @active_main_nav_item.url.length
            @active_main_nav_item = mni
          end
        else
          @active_main_nav_item = mni
        end
      end
    end
  end

  def collect_pages_nav_columns
    @pages_nav_columns = []
    ContentPage.roots.visibles.by_prior.each do |rootpage|
      unless rootpage.home?
        column_data = {}
        column_data[:title] = rootpage.title
        column_data[:pages] = []
        rootpage.children.visibles.by_prior.each do |childpage|
          column_data[:pages] << childpage
        end
        @pages_nav_columns << column_data
      end
    end
  end

  def collect_social_links
    @social_links = SocialLink.visibles
  end
end
