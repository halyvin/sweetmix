class IngridientsPacksRelation < ActiveRecord::Base
  belongs_to :product_pack
  belongs_to :product_ingridient
  attr_accessible :price, :weight,
                  :product_pack, :product_pack_id,
                  :product_ingridient, :product_ingridient_id

  validates :price, :weight, :product_pack, :product_ingridient, presence: true
end
