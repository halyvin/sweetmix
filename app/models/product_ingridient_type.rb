class ProductIngridientType < ActiveRecord::Base
  has_many :ingridients, class_name: "ProductIngridient",
                         foreign_key: "product_type_id"

  attr_accessible :name

  validates :name, presence: true
end
