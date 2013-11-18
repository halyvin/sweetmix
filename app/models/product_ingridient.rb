class ProductIngridient < ActiveRecord::Base
  has_and_belongs_to_many :types, foreign_key: "product_ingridient_type_id"
  has_and_belongs_to_many :products
  has_many :product_packs_ingridients
  has_many :packs, through: :product_packs_ingridients,
                   foreign_key: "product_pack_id"

  # TODO
  # mount_uploader :image, ProductIngridientImageUploader

  attr_accessible :image, :name

  validates :name, presence: true
end
