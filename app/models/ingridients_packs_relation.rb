# -*- encoding : utf-8 -*-
class IngridientsPacksRelation < ActiveRecord::Base
  belongs_to :product_pack
  belongs_to :product_ingridient
  attr_accessible :price, :weight,
                  :product_pack, :product_pack_id,
                  :product_ingridient, :product_ingridient_id

  validates :price, :weight, :product_pack, :product_ingridient, presence: true
  validates :weight, numericality: { only_integer: true, greater_than: 0 }
  validate :weight_cannot_be_greater_then_pack_capacity

  private
    def weight_cannot_be_greater_then_pack_capacity
      if product_pack.present? && product_pack.capacity < weight
        errors.add :weight, "Вес не может быть больше, чем емкость упаковки (#{product_pack.capacity})"
      end
    end
end
