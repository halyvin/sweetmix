class Order < ActiveRecord::Base
  has_many :orders_products_relations, dependent: :destroy
  has_many :products, through: :orders_products_relations

  # pay_status:
  #   0 - cash
  #   1 - online
  #   2 - online & paid

  attr_accessor :terms_of_service

  attr_accessible :price, :products_price, :delivery_price, :discount_sum,
                  :clt_email, :clt_first_name, :clt_last_name, :clt_phone,
                  :dlv_date, :dlv_period, :dlv_city, :dlv_address,
                  :clt_comment, :terms_of_service

  validates :secret, :price, :products_price, :clt_email, :clt_first_name,
            :dlv_date, :dlv_city, :dlv_address,
            presence: true

  validates :secret, uniqueness: true

  validates :clt_email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      on: :create }

  validates :clt_first_name, length: { minimum: 2 }

  validates :terms_of_service, acceptance: true, on: :create

  before_validation :build_secret
  before_save :build_products_hash


  def name
    self.class.model_name.human + " #" + id.to_s
  end

  def clt_full_name
    clt_first_name + (clt_last_name.present? ? " #{clt_last_name}" : '')
  end

  def cash_payment?
    pay_status.nil? || pay_status == 0
  end

  def paid?
    pay_status.nil? || pay_status == 0 || pay_status > 1
  end

  private
    def build_secret
      self.secret = SecureRandom.uuid if self.secret.nil?
    end

    def build_products_hash
      # TODO more parts for hash and put hash building to Product model
      # hash_parts = []
      # orders_products_relations.all.each do |rel|
      #   product = rel.product
      #   hash_parts << "#{product.id},#{rel.count},#{product.price}"
      # end
      # self.products_hash = hash_parts.join ";"
      self.products_hash = "#" unless self.products_hash.present?
    end
end
