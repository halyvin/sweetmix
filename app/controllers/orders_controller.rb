# -*- encoding : utf-8 -*-
class OrdersController < FrontendController

  before_filter :collect_basket_items

  def basket
  end

  def new
    if @basket_items.any?
      total_of_basket = @basket_items.map{|prod| prod.price }.reduce(:+)
      @order = Order.new price: total_of_basket, products_price: total_of_basket
    else
      redirect_to basket_path
    end
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
        format.html do
          @basket_items.each do |basket_product|
            @order.orders_products_relations.create product: basket_product,
                                                    count: basket_product.count
          end
          clear_all_products_in_cart
          redirect_to order_path(@order.secret)
        end
        format.json { render :json => @order,
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