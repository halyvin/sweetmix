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

    if @category.constuctable?
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

  # creating in constructor
  def create
    front = chiksa
    if admin_user_signed_in?
      prod_params = params[:product]
      if prod_params
        pack = ProductPack.find prod_params[:pack_id]
        @product = Product.new pcba: true, price: 200, weight: 100,
                               category_id: pack.category_id, pack_id: pack.id,
                               basis_id: prod_params[:basis_id], hided: true
        # TODO calculate price and width
        # TODO parse ingridients
        if @product.valid?
          @product.save
        else
          @product = nil
        end
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
