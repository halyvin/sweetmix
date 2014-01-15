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
    total_of_basket = @basket_items.map{|prod| prod.price }.reduce(:+)
    @order.price = total_of_basket
    @order.products_price = total_of_basket
    @order.pay_status = params[:payment_method] == "1" ? 1 : 0
   
    respond_to do |format|
      if @order.save
        # TODO email notices
        format.html  { redirect_to(basket_url,
                      :notice => 'Post was successfully created.') }
        format.json  { render :json => @order,
                      :status => :created, :location => @order }
      else
        format.html do
          @order.terms_of_service = false
          render :action => "new"
        end
        format.json { render :json => @order.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @order = Order.find_by_secret! params[:secret]
  end

  private
    def collect_basket_items
      @basket_items = get_products_of_cart
    end

end