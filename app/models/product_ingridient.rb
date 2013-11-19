class ProductIngridient < ActiveRecord::Base
  belongs_to :type, class_name: "ProductIngridientType"
  has_and_belongs_to_many :products
  has_many :ingridients_packs_relations
  has_many :packs, through: :ingridients_packs_relations,
                   source: :product_pack

  accepts_nested_attributes_for :ingridients_packs_relations, :allow_destroy => true, :reject_if => :all_blank

  # TODO
  # mount_uploader :image, ProductIngridientImageUploader

  attr_accessible :image, :name, :type, :type_id,
                  :ingridients_packs_relations_attributes

  validates :name, presence: true
end
