class Slide < ActiveRecord::Base
  mount_uploader :image, BaseImageUploader

  attr_accessible :title, :subtitle, :descr, :image, :backg, :custom,
                  :btn_link, :btn_text, :image_at_right, :hided, :prior

  validates :title, presence: true
  validates :btn_text, presence: true, :if => "btn_link.present?"
  validates :backg, numericality: { only_integer: true,
                                    greater_than: 0,
                                    less_than_or_equal_to: 2
                                  }, allow_nil: true

  default_scope order('prior ASC')
  scope :visibles, where(hided: false)

  def name
    title
  end
end
