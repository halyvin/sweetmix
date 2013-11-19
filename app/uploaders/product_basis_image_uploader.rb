# encoding: utf-8
class ProductBasisImageUploader < BaseImageUploader
  process :resize_to_limit => [190, nil]

  def default_url
    ActionController::Base.helpers.asset_path("fallback/basis_image_" + [version_name, "default.png"].compact.join('_'))
  end

end
