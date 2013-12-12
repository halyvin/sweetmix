# -*- encoding : utf-8 -*-
class ProductsController < FrontendController

  before_filter :detect_category

  def index
    if @category
      # some
    else
      redirect_to root_url
    end
  end

  def constructor
    if @category
      # some
    else
      redirect_to root_url
    end
  end

  private

  def detect_category
    if params[:category_slug]
      @category = ProductCategory.find_by_slug! params[:category_slug]
    end
  end
end
