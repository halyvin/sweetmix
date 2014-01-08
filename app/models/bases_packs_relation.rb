class BasesPacksRelation < ActiveRecord::Base
  belongs_to :product_pack
  belongs_to :product_basis
  attr_accessible :price, :weight,
                  :product_pack, :product_pack_id,
                  :product_basis, :product_basis_id

  validates :price, :weight, :product_pack, :product_basis, presence: true

  # TODO validates weight less than capacity of pack
  # then validate pack capacity to be greater than any basis weight
end
