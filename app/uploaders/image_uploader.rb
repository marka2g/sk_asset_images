class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  before :cache, :setup_available_image_types
  before :cache, :setup_image_types_hash

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # wkg...
  # ImageType.all.each do |type|
  #   version type.name.to_sym, :if => "has_#{type.name}?"
  # end

  # conditional processing: e.g. we process "thumb" version only if
  # it was defined in image_types
  version :thumb, :if => :has_thumb? do
    process :dynamic_resize_to_fit => :thumb
  end

  version :headshot, :if => :has_headshot? do
    process :dynamic_resize_to_fit => :headshot
  end

  version :biopic, :if => :has_biopic? do
    process :dynamic_resize_to_fit => :biopic
  end

  version :boxcover, :if => :has_boxcover? do
    process :dynamic_resize_to_fit => :boxcover
  end

  version :promo, :if => :has_promo? do
    process :dynamic_resize_to_fit => :promo
  end

  # a wrapper to resize_to_fill method
  def dynamic_resize_to_fit(size)
    resize_to_fill *(@image_sizes[size]) if @image_sizes[size]
  end

  def method_missing(method, *args)
    # if a method(has_blah_size?) with name is missed, it should return false
    return false if method.to_s.match(/has_(.*)\?/)
    super
  end

protected

  def setup_available_image_types(file)
    model.attachable.image_types.each do |type|
      self.class_eval do
        define_method("has_#{type.name.to_sym}?".to_sym) do |file|
          [true, file]
        end
      end
    end
  end

  # this is used for method_missing
  def setup_image_types_hash(file)
    @image_sizes = Hash.new(0)
    model.attachable.image_types.each do |type|
       @image_sizes.merge!(type.name.to_sym => [type.crop_x, type.crop_y])
    end
  end

end