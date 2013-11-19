class ProductIngridientType < ActiveRecord::Base
  has_many :ingridients, class_name: "ProductIngridient",
                         foreign_key: "type_id"

  attr_accessible :name

  validates :name, presence: true

  # default_scope order('product_ingridient_types.id asc')
end
