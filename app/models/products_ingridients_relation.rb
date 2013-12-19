class ProductsIngridientsRelation < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_ingridient
  attr_accessible :count,
                  :product, :product_id,
                  :product_ingridient, :product_ingridient_id

  validates :count, :product, :product_ingridient, presence: true
end
