# encoding: utf-8
class ProductIngridientImageUploader < BaseImageUploader
  process :resize_to_fill => [94, 94]

  def default_url
    ActionController::Base.helpers.asset_path("fallback/ingridient_image_" + [version_name, "default.png"].compact.join('_'))
  end

end
