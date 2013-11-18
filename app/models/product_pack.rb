class ProductPack < ActiveRecord::Base
  belongs_to :category, class_name: "ProductCategory"
  has_many :products, foreign_key: "pack_id"
  has_many :product_packs_bases
  has_many :bases, through: :product_packs_bases,
                   foreign_key: "product_basis_id"
  has_many :product_packs_ingridients
  has_many :ingridients, through: :product_packs_ingridients,
                         foreign_key: "product_ingridient_id"

  # TODO
  # mount_uploader :image, ProductPackImageUploader

  attr_accessible :capacity, :category, :category_id, :image, :name

  validates :name, :capacity, :category, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
