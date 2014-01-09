# -*- encoding : utf-8 -*-
class BasketController < FrontendController

  def index
    @basket_items = get_products_of_cart
  end

end