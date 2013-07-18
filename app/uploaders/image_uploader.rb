class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # before :cache, :setup_available_sizes
  before :cache, :setup_available_image_types
  before :cache, :setup_sizes_hash

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # wkg...
  # ImageType.all.each do |type|
  #   version type.name.to_sym, :if => "has_#{type.name}_size?"
  # end

  # conditional processing: e.g. we process "thumb" version only if
  # it was defined in image_types
  version :thumb, :if => :has_thumb_size? do
    process :dynamic_resize_to_fit => :thumb
  end

  version :headshot, :if => :has_headshot_size? do
    process :dynamic_resize_to_fit => :headshot
  end

  version :biopic, :if => :has_biopic_size? do
    process :dynamic_resize_to_fit => :biopic
  end

  version :boxcover, :if => :has_boxcover_size? do
    process :dynamic_resize_to_fit => :boxcover
  end

  version :promo, :if => :has_promo_size? do
    process :dynamic_resize_to_fit => :promo
  end

  # a wrapper to resize_to_fill method
  def dynamic_resize_to_fit(size)
    resize_to_fill *(@image_sizes[size]) if @image_sizes[size]
  end

  def method_missing(method, *args)
    # if a method with name is missed, it should return false
    return false if method.to_s.match(/has_(.*)_size\?/)
    super
  end

protected

  def setup_available_sizes(file)
    # names = model.attachable.image_types.collect(&:name)
    # names.each.to_sym
    model.attachable.image_types.each do |type|
      self.class_eval do
        define_method("has_#{type.name.to_sym}_size?".to_sym) { true }
      end
    end
  end

  # this is used for method_missing
  def setup_sizes_hash(file)
    @image_sizes = Hash.new(0)
    model.attachable.image_types.each do |type|
       @image_sizes.merge!(type.name.to_sym => [type.crop_x, type.crop_y])
    end
  end

end