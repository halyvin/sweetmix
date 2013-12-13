# -*- encoding : utf-8 -*-
class ProductsController < FrontendController

  before_filter :detect_category

  def index
    
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

  private

  def detect_category
    if params[:category_slug]
      @category = ProductCategory.find_by_slug! params[:category_slug]
    else
      redirect_to root_url
    end
  end
end
