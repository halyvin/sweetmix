# -*- encoding : utf-8 -*-
class OrdersController < FrontendController

  before_filter :collect_basket_items

  def basket
    
  end

  def new
    total_of_basket = @basket_items.map{|prod| prod.price }.reduce(:+)
    @order = Order.new price: total_of_basket, products_price: total_of_basket
  end

  def create
    @order = Order.new(params[:order])
   
    respond_to do |format|
      if @order.save
        format.html  { redirect_to(basket_url,
                      :notice => 'Post was successfully created.') }
        format.json  { render :json => @order,
                      :status => :created, :location => @order }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @order.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  private
    def collect_basket_items
      @basket_items = get_products_of_cart
    end

end