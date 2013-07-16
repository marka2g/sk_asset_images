# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  before :store, :setup_available_image_types
  # after :store, :setup_available_image_types

  storage :file

  # def initialize(model = nil, mounted_as = nil)
binding.pry
    if @image_types
      puts 'yo'
      # @image_types.each do |type|
      #   version type.name.to_sym do
      #     process :resize_to_fill => [type.crop_x, type.crop_y]
      #   end
      # end
    end
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def method_missing(method, *args)
    # return false if method.to_s.match(/has_(.*)_size\?/)
    super
  end

protected

  def setup_available_image_types(file)
binding.pry
    @image_types = []
 # binding.pry
    model.attachable.image_types.each do |type|
      @image_types << type   
     # self.class_eval do
     #  version type.name.to_sym do
     #    process :resize_to_fill => [type.crop_x, type.crop_y]
     #  end
     # end
     return @image_types
    end
  end


end


