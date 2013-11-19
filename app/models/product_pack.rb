class ProductPack < ActiveRecord::Base
  belongs_to :category, class_name: "ProductCategory"
  has_many :products, foreign_key: "pack_id"
  has_many :bases_packs_relations
  has_many :bases, through: :bases_packs_relations,
                   source: :product_basis
  has_many :ingridients_packs_relations
  has_many :ingridients, through: :ingridients_packs_relations,
                         source: :product_ingridient

  # TODO
  # mount_uploader :image, ProductPackImageUploader

  attr_accessible :capacity, :category, :category_id, :image, :name

  validates :name, :capacity, :category, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
