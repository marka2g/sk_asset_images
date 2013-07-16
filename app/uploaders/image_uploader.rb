# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  before :cache, :setup_available_sizes
  # before :store, :setup_available_sizes

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # this works because version is defined
  # ImageType.all.each do |type|
  #   version type.name.to_sym do
  #     process :resize_to_fill => [type.crop_x, type.crop_y]
  #   end
  # end

  def method_missing(method, *args)
    return false if method.to_s.match(/not_su/)
    super
  end

  protected
  # the method called at the start
  def setup_available_sizes(file)
    model.attachable.image_types.each do |type|      
      self.class_eval do
        define_method("#{type.name}".to_sym) { true }
      end
    end
  end

end

