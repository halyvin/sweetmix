# -*- encoding : utf-8 -*-
class ProductCategory < ActiveRecord::Base
  has_many :packs, class_name: "ProductPack",
                   foreign_key: "category_id" #, dependent: :restrict
  has_many :products, foreign_key: "category_id" #, dependent: :restrict

  before_destroy :check_packs_and_products_existence_before_destroy

  # TODO ?
  # mount_uploader :icon, ProductCategoryIconUploader

  attr_accessible :icon, :name_few, :name_many, :name_one, :name_other, :slug, :construct_off

  validates :slug, :name_few, :name_many, :name_one, :name_other, presence: true
  validates :slug, uniqueness: { case_sensitive: false }

  def name(numb = nil)
    if numb
      Russian.p numb, name_one, name_few, name_many, name_other
    else
      name_other
    end
  end

  def constuctable?
    !self.construct_off? && self.packs.active.any?
  end

  private
    def check_packs_and_products_existence_before_destroy
      can_destroy = true
      if self.packs.any?
        can_destroy = false
        self.errors.add(:base, "Нельзя удалить категорию, пока есть хотя бы одна упаковка, привязанная к этой категории")
        # dunno how to send message to user about deletion cancelation
      end
      if self.products.any?
        can_destroy = false
        self.errors.add(:base, "Нельзя удалить категорию, пока есть хотя бы один товар, привязанный к этой категории")
        # here too
      end
      return can_destroy
    end
end
