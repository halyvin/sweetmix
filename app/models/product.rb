class Product < ActiveRecord::Base
  belongs_to :category, class_name: "ProductCategory"
  belongs_to :pack,     class_name: "ProductPack"
  belongs_to :basis,    class_name: "ProductBasis"
  has_and_belongs_to_many :ingridients, class_name: "ProductIngridient"

  # TODO
  # mount_uploader :image, ProductImageUploader

  attr_accessible :article, :image, :name, :pcba, :plain, :price, :weight,
                  :category, :category_id, :pack, :pack_id, :basis, :basis_id,
                  :ingridients

  validates :price, presence: true
end
