class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  before :cache, :setup_available_sizes
  before :cache, :setup_sizes_hash

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # we process images with a custom method (read above)
  process :dynamic_resize_to_fit => :default

  # default processing, we assume that each model has a "mini" version
  version :thumb do
    process :dynamic_resize_to_fit => :mini
  end

  # conditional processing: we process "thumb" version only if it was defined in model
  version :thumb, :if => :has_thumb_size? do
    process :dynamic_resize_to_fit => :thumb
  end

  # a wrapper to resize_to_fill method
  def dynamic_resize_to_fit(size)
binding.pry
    # resize_to_fit *(model.class::IMAGE_SIZES[size])
    resize_to_fill *(@image_sizes[size]) if @image_sizes[size]
  end

  def method_missing(method, *args)
    # we've already defined "has_VERSION_size?", so if a method with
    # similar name is missed, it should return false
    return false if method.to_s.match(/has_(.*)_size\?/)
    super
  end

  protected
  # the method called at the start
  # it checks for <model>::IMAGE_SIZES hash and define a custom method "has_VERSION_size?"
  # (more on this later in the article)
  def setup_available_sizes(file)
    types = model.attachable.image_types
    types.each do |type|
      self.class_eval do
        define_method("has_#{type.name}_size?".to_sym) { true }
      end
    end
  end

  def setup_sizes_hash(file)
    @image_sizes = Hash.new(0)
    model.attachable.image_types.each do |type|
       @image_sizes.merge!(type.name.to_sym => [type.crop_x, type.crop_y])
    end
# binding.pry
  end

end