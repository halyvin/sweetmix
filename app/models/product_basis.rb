class ProductBasis < ActiveRecord::Base
  has_many :products, foreign_key: "basis_id"
  has_many :bases_packs_relations
  has_many :packs, through: :bases_packs_relations,
                   source: :product_pack

  accepts_nested_attributes_for :bases_packs_relations, :allow_destroy => true, :reject_if => :all_blank

  mount_uploader :image, ProductBasisImageUploader

  # TODO nutr_val as object collection ( store )

  attr_accessible :composition, :descr, :image, :name, :nutr_val,
                  :bases_packs_relations_attributes

  validates :name, presence: true
end
