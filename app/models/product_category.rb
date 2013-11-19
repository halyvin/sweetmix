class ProductCategory < ActiveRecord::Base
  has_many :packs, class_name: "ProductPack", foreign_key: "category_id"
  has_many :products, foreign_key: "category_id"

  # TODO
  # mount_uploader :icon, ProductCategoryIconUploader

  attr_accessible :icon, :name_few, :name_many, :name_one, :name_other, :slug

  validates :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }

  def name(numb)
    if numb
      Russian.p numb, name_one, name_few, name_many, name_other
    else
      name_one
    end
  end
end
