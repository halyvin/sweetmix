class ProductPacksBases < ActiveRecord::Base
  belongs_to :product_pack
  belongs_to :product_basis
  attr_accessible :price, :weight

  validates :price, :weight, presence: true
end
