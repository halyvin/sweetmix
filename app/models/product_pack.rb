# -*- encoding : utf-8 -*-
class ProductPack < ActiveRecord::Base
  belongs_to :category, class_name: "ProductCategory"
  has_many :products, foreign_key: "pack_id" #, dependent: :restrict
  has_many :bases_packs_relations, dependent: :destroy
  has_many :bases, through: :bases_packs_relations,
                   source: :product_basis
  has_many :ingridients_packs_relations, dependent: :destroy
  has_many :ingridients, through: :ingridients_packs_relations,
                         source: :product_ingridient

  mount_uploader :image, ProductPackImageUploader

  before_destroy :check_products_existence_before_destroy

  attr_accessible :capacity, :category, :category_id, :image, :name

  validates :name, :capacity, :category, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validate :capacity_cannot_be_less_than_weigth_of_any_related_bases

  # pack can be active only with at least one bases
  scope :active, joins(:bases_packs_relations).group('product_packs.id')

  private
    def check_products_existence_before_destroy
      can_destroy = true
      if self.products.any?
        can_destroy = false
        self.errors.add(:base, "Нельзя удалить упаковку, пока есть хотя бы один товар с ней")
        # dunno how to send message to user about deletion cancelation
      end
      return can_destroy
    end

    def capacity_cannot_be_less_than_weigth_of_any_related_bases
      min_av_cap = 0
      bases_packs_relations.each do |bprel|
        min_av_cap = bprel.weight if bprel.weight > min_av_cap
      end
      if capacity < min_av_cap
        errors.add(:capacity, "Одна из основ, указанных для этой упаковки, имеет вес больший, чем указанная новая ёмкость (#{min_av_cap})")
      end
    end
end
