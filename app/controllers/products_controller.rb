# -*- encoding : utf-8 -*-
class ProductsController < FrontendController

  before_filter :detect_category

  def index
    @products = Product.visibles.precreated.where(category_id: @category.id)
  end

  def constructor
    @pack = nil
    @basis = nil
    @ingridient_structured = []

    if (admin_user_signed_in? && @category.packs.active.any?) || @category.constuctable?
      if @category.packs.count == 1
        @pack = @category.packs.first
      else
        if params[:pack]
          @pack = ProductPack.find_by_id params[:pack]
        end
      end

      unless @pack.nil?
        if params[:basis]
          @basis = ProductBasis.find_by_id params[:basis]
        end
      end

      unless @pack.nil? && @basis.nil?
        ingrids_by_types = []

        avl_ings = @pack.ingridients_packs_relations.includes(:product_ingridient)
        avl_ings.each do |iprel|
          ing = iprel.product_ingridient
          ing.save_packs_parameter_of iprel
          if ingrids_by_types[ing.type_id].nil?
            ingrids_by_types[ing.type_id] = { ing_type: ing.type, ingridients: [] }
          end
          ingrids_by_types[ing.type_id][:ingridients] << ing
        end

        @ingridient_structured = ingrids_by_types.compact
      end
    else
      redirect_to action: :index
    end
  end

  # creating from constructor
  def create
    can_create_with_this_params = true
    new_prod_params = params[:product]
    can_create_with_this_params = false unless new_prod_params
    it_is_receipt_creation = new_prod_params[:pcba] &&
                             new_prod_params[:pcba].present? &&
                             admin_user_signed_in?
    if can_create_with_this_params && it_is_receipt_creation
      can_create_with_this_params = false
    end

    if can_create_with_this_params
      pack = ProductPack.find new_prod_params[:pack_id]

      cr_pars = { category_id: pack.category_id,
                  pack_id: pack.id,
                  basis_id: new_prod_params[:basis_id] }

      if it_is_receipt_creation
        cr_pars[:pcba] = true
        cr_pars[:hided] = true
      end

      @product = Product.new cr_pars
      @product.calculate_price_and_weight!
        
      if @product.valid?
        @product.save
        # parse ingridients
        ingrids_str_parts = new_prod_params[:ingrids_str].split(',')
        if ingrids_str_parts.any?
          ingrids_str_parts.each do |instrprt|
            choosed_ingridient_data = instrprt.split 'c'
            if ProductIngridient.where(id: choosed_ingridient_data[0]).count > 0
              @product.products_ingridients_relations.create(
                product_ingridient_id: choosed_ingridient_data[0],
                count: choosed_ingridient_data[1])
            end
          end
          @product.calculate_price_and_weight!
          @product.save
        end
        add_product_to_cart(@product, true) unless it_is_receipt_creation
      else
        @product = nil
      end
    else
      redirect_to root_url
    end
  end

  private

  def detect_category
    if params[:category_slug]
      @category = ProductCategory.find_by_slug! params[:category_slug]
    else
      redirect_to root_url
    end
  end
end
