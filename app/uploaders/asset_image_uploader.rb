class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_limit(600, 600)
  end

  version :thumb do
    process :crop
    resize_to_fill(100, 100)
  end

  def crop
# binding.pry
    if model.crop_x.present?
      img = MiniMagick::Image.open(model.asset_image.large.path)
      crop_params = "#{model.crop_w}x#{model.crop_h}+#{model.crop_x}+#{model.crop_y}"
      img.crop(crop_params)
      img.write(model.asset_image.path)
    end
  end

end