class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # "uploads/#{model.imageable_type.to_s.underscore}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}" #might need this...
  end

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  # this wud work, except, now the version does not exist in the class...
  ImageType.all.each do |type|
    version type.name.to_sym do
      process :resize_to_fill => [type.crop_x, type.crop_y]
    end
  end

  # rmagick crop for from end tools.
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
end
