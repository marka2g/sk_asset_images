class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
# binding.pry
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  ImageType.all.each do |type|
    version type.name.to_sym do
      process :resize_to_fill => [type.crop_x, type.crop_y]
      # process :store_geometry
    end
  end

  def store_geometry
    if @file
      img = ::Magick::Image::read(@file.file).first
      if model
        model.width = img.columns
        model.height = img.rows
      end
    end
  end

  # rmagick crop for from end.
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
