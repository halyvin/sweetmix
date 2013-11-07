class StaticImage < ActiveRecord::Base
  mount_uploader :image, StaticImageUploader

  attr_accessible :image

  validate :image, :presence

  # For ActiveAdmin interface
  def name
    self.class.model_name.human + " #" + id.to_s
  end
end
