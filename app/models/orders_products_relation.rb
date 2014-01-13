class OrdersProductsRelation < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :count, :order, :order_id, :product, :product_id

  validates :count, :order, :product, presence: true
end
