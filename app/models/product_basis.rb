# -*- encoding : utf-8 -*-
class ProductBasis < ActiveRecord::Base
  has_many :products, foreign_key: "basis_id" #, dependent: :restrict
  has_many :bases_packs_relations, dependent: :destroy
  has_many :packs, through: :bases_packs_relations,
                   source: :product_pack

  before_destroy :check_products_existence_before_destroy

  accepts_nested_attributes_for :bases_packs_relations, :allow_destroy => true, :reject_if => :all_blank

  mount_uploader :image, ProductBasisImageUploader

  store :nutr_val, accessors: [ :proteins, :fats, :carbohydrates, :calories ],
                   coder: JSON

  attr_accessible :composition, :descr, :image, :name,
                  :proteins, :fats, :carbohydrates, :calories,
                  :bases_packs_relations_attributes

  validates :name, presence: true
  validates_associated :bases_packs_relations

  def proteins
    nutr_val[:proteins].to_f
  end
  def fats
    nutr_val[:fats].to_f
  end
  def carbohydrates
    nutr_val[:carbohydrates].to_f
  end
  def calories
    nutr_val[:calories].to_f
  end

  # Get price or weight of basis for pack
  #   pack - ProductPack object or just id of this object (prefer)
  def price_for(pack)
    get_packs_parameter_of pack, :price
  end
  def weight_for(pack)
    get_packs_parameter_of pack, :weight
  end

  private
    def check_products_existence_before_destroy
      can_destroy = true
      if self.products.any?
        can_destroy = false
        self.errors.add(:base, "Нельзя удалить основу, пока есть хотя бы один товар с ней")
        # dunno how to send message to user about deletion cancelation
      end
      return can_destroy
    end

    # pack - ProductPack object or just id of this object (prefer)
    # param - [Symbol] [:price, :weight]
    def get_packs_parameter_of(pack, param)
      pack = pack.id if pack.is_a? ProductPack
      @_packs_parameters = [] unless @_packs_parameters
      if @_packs_parameters[pack].nil?
        relation = self.bases_packs_relations.
                        where(product_pack_id: pack).
                        limit(1).first
        raise Errors::UnprocessableEntity if relation.nil?
        @_packs_parameters[pack] = { price: relation.price, weight: relation.weight }
      end
      @_packs_parameters[pack][param]
    end

end
