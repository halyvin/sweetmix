# encoding: utf-8
class ProductPackImageUploader < BaseImageUploader
  process :resize_to_limit => [412, 320]

  version :thumb do
    process :resize_to_limit => [206, 160]
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/pack_image_" + [version_name, "default.png"].compact.join('_'))
  end

end
