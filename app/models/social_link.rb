# -*- encoding : utf-8 -*-
class SocialLink < ActiveRecord::Base

  attr_accessible :hided, :prior, :social_type, :url

  validates :prior, :social_type, presence: true
  validates :social_type, numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0,
                                          less_than: 5 }

  default_scope order('prior ASC')
  scope :visibles, where(hided: false)

  class << self
    def social_type_variants
      [ ["Instagram",     0],
        ["YouTube",       1],
        ["ВКонтакте",     2],
        ["Одноклассники", 3],
        ["Facebook",      4] ]
    end
  end

  def name
    social_type_name
  end

  def social_type_name
    self.class.social_type_variants[social_type][0]
  end

  def social_type_short
    shorts = [ 'in', 'yt', 'vk', 'ok', 'fb' ]
    shorts[ social_type ]
  end
end
