class ProductBasis < ActiveRecord::Base
  has_many :products, foreign_key: "basis_id"
  has_many :packs, through: :product_packs_bases,
                   foreign_key: "product_pack_id"

  # TODO
  # mount_uploader :image, ProductBasisImageUploader

  # TODO nutr_val as object collection ( store )

  attr_accessible :composition, :descr, :image, :name, :nutr_val

  validates :name, presence: true
end
