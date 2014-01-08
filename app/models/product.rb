class Product < ActiveRecord::Base
  belongs_to :category, class_name: "ProductCategory"
  belongs_to :pack,     class_name: "ProductPack"
  belongs_to :basis,    class_name: "ProductBasis"

  has_many :products_ingridients_relations, dependent: :destroy
  has_many :ingridients, through: :products_ingridients_relations,
                         source: :product_ingridient

  mount_uploader :own_image, ProductBasisImageUploader


  accepts_nested_attributes_for :products_ingridients_relations,
                                allow_destroy: true,
                                reject_if: :all_blank

  attr_accessible :pcba, :plain, :name, :price, :own_image, :own_descr,
                  :weight, :products_ingridients_relations_attributes,
                  :category, :category_id, :pack, :pack_id, :basis, :basis_id,
                  :hided

  before_validation :check_and_make_name_if_can

  validates :name, :price, presence: true
  validates :weight, :category, :pack, :basis, presence: true,
                                               :unless => "plain?"
  # made decision not validate category-pack-basis connections
  # made decision not validate pack-ingridients connections :)

  validates_associated :products_ingridients_relations

  scope :visibles, where(hided: false)
  scope :precreated, where(pcba: true)

  def image
    own_image.blank? && basis.present? ? basis.image : own_image
  end

  def descr
    own_descr.blank? && basis.present? ? basis.descr : own_descr
  end

  def calculate_price_and_weight!
    whole_price = 0
    whole_weight = 0
    if pack.present? && basis.present?
      whole_price = basis.price_for(pack)
      whole_weight = basis.weight_for(pack)
      ingridients.each do |ingrid|
        whole_price += ingrid.price_for(pack)
        whole_weight += ingrid.weight_for(pack)
      end
    end
    self.price = whole_price
    self.weight = whole_weight
  end

  private
    def check_and_make_name_if_can
      unless self.name.present? || self.plain?
        if self.basis.present?
          self.name = self.basis.name
        end
      end
    end
end
