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
