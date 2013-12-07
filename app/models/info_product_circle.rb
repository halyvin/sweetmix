class InfoProductCircle < ActiveRecord::Base
  attr_accessible :hided, :title, :prior, :prodcode, :url

  validates :title, :url, :prodcode, presence: true
  validates :prodcode, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: 3 }

  default_scope order('prior ASC')
  scope :visibles, where(hided: false)

  def name
    title
  end
end
