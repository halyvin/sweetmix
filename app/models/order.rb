class Order < ActiveRecord::Base
  has_many :orders_products_relations, dependent: :destroy
  has_many :products, through: :orders_products_relations

  # pay_status

  attr_accessible :price, :products_price, :delivery_price, :discount_sum,
                  :clt_email, :clt_first_name, :clt_last_name, :clt_phone,
                  :dlv_date, :dlv_period, :dlv_city, :dlv_address,
                  :products_hash, :clt_comment

  validates :secret, :price, :products_price, :clt_email, :clt_first_name,
            :dlv_date, :dlv_city, :dlv_address, :products_hash,
            presence: true

  validates :clt_email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      on: :create }

  validates :clt_first_name, length: { minimum: 2 }

  # validates :terms_of_service, :acceptance => true

  before_create :build_secret


  def name
    self.class.model_name.human + " #" + id.to_s
  end

  private
    def build_secret
      self.secret = SecureRandom.uuid
    end
end
