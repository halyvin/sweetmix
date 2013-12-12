class ProductBasis < ActiveRecord::Base
  has_many :products, foreign_key: "basis_id"
  has_many :bases_packs_relations
  has_many :packs, through: :bases_packs_relations,
                   source: :product_pack

  accepts_nested_attributes_for :bases_packs_relations, :allow_destroy => true, :reject_if => :all_blank

  mount_uploader :image, ProductBasisImageUploader

  store :nutr_val, accessors: [ :proteins, :fats, :carbohydrates, :calories ],
                   coder: JSON

  attr_accessible :composition, :descr, :image, :name,
                  :proteins, :fats, :carbohydrates, :calories,
                  :bases_packs_relations_attributes

  validates :name, presence: true

  def proteins
    # super.to_f
    nutr_val[:proteins].to_f
  end
  def fats
    # super.to_f
    nutr_val[:fats].to_f
  end
  def carbohydrates
    # super.to_f
    nutr_val[:carbohydrates].to_f
  end
  def calories
    # super.to_f
    nutr_val[:calories].to_f
  end

  # Get price or weight of basis for pack
  #   pack - ProductPack object or just id of this object (prefer)
  def price_for(pack)
    get_packs_parameter_of pack, :price
  end
  def weight_for(pack)
    get_packs_parameter_of pack, :price
  end

  private

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
