class ProductPacksIngridients < ActiveRecord::Base
  belongs_to :product_pack
  belongs_to :product_ingridient
  attr_accessible :price, :weight

  validates :price, :weight, presence: true
end
