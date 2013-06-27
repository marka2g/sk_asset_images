class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick - having annoying issues with minimagick

  storage :file

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

  # rmagick crop
  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end

# minimagick crop method
#   def crop
#     if model.crop_x.present?
#       img = MiniMagick::Image.open(model.asset_image.large.path)
#       crop_params = "#{model.crop_w}x#{model.crop_h}+#{model.crop_x}+#{model.crop_y}"
#       img.crop(crop_params)
#       img.write(model.asset_image.path)
#     end
#   end

end