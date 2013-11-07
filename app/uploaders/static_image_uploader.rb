# encoding: utf-8

class StaticImageUploader < BaseImageUploader
  
  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [266, 128]
  end

end
