class ProductIngridient < ActiveRecord::Base
  belongs_to :type, class_name: "ProductIngridientType"
  has_and_belongs_to_many :products
  has_many :ingridients_packs_relations
  has_many :packs, through: :ingridients_packs_relations,
                   source: :product_pack

  # TODO
  # mount_uploader :image, ProductIngridientImageUploader

  attr_accessible :image, :name, :type, :type_id

  validates :name, presence: true
end
