class ProductIngridientType < ActiveRecord::Base
  has_and_belongs_to_many :ingridients, foreign_key: "product_ingridient_id"

  attr_accessible :name

  validates :name, presence: true
end
