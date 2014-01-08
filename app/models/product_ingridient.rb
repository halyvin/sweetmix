class ProductIngridient < ActiveRecord::Base
  belongs_to :type, class_name: "ProductIngridientType"
  has_many :ingridients_packs_relations, dependent: :destroy
  has_many :packs, through: :ingridients_packs_relations,
                   source: :product_pack
  has_many :products_ingridients_relations, dependent: :destroy
  # has_many :products, through: :products_ingridients_relations # don't need right now

  accepts_nested_attributes_for :ingridients_packs_relations, :allow_destroy => true, :reject_if => :all_blank

  mount_uploader :image, ProductIngridientImageUploader

  store :nutr_val, accessors: [ :proteins, :fats, :carbohydrates, :calories ],
                   coder: JSON

  attr_accessible :image, :name, :descr, :type, :type_id,
                  :proteins, :fats, :carbohydrates, :calories,
                  :ingridients_packs_relations_attributes

  validates :name, presence: true
  validates_associated :ingridients_packs_relations

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

  # Get price or weight of ingridient for pack
  #   pack - ProductPack object or just id of this object (prefer)
  def price_for(pack)
    get_packs_parameter_of pack, :price
  end
  def weight_for(pack)
    get_packs_parameter_of pack, :weight
  end

  def save_packs_parameter_of(relation)
    @_packs_parameters = [] unless @_packs_parameters
    @_packs_parameters[relation.product_pack_id] = { price: relation.price,
                                                     weight: relation.weight }
  end

  private

  # pack - ProductPack object or just id of this object (prefer)
  # param - [Symbol] [:price, :weight]
  def get_packs_parameter_of(pack, param)
    pack = pack.id if pack.is_a? ProductPack
    @_packs_parameters = [] unless @_packs_parameters
    if @_packs_parameters[pack].nil?
      relation = self.ingridients_packs_relations.
                      where(product_pack_id: pack).
                      limit(1).first
      raise Errors::UnprocessableEntity if relation.nil?
      @_packs_parameters[pack] = { price: relation.price, weight: relation.weight }
    end
    @_packs_parameters[pack][param]
  end
end
