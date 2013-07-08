class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    # process :crop
    resize_to_fill(100, 100)
  end

  version :medium do
    resize_to_limit(200, 200)
  end

  version :large_thumb do
    resize_to_limit(300, 300)
  end

  version :large do
    resize_to_limit(400, 400)
  end

  ImageType.all.each do |version_type|
    image_type = ImageType.where(name: version_type.name).first
    # version(version_type) {process generate_type: image_type}
  end

  def generate_type(image_type)
    options = image_type
    ImageManipulation::VersionConversion.new(image_type)
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

# ImageManipulation::Versioner.new(:input_file => "#{Rails.root.join("public/uploads/test/input/")}biopic_test.jpg", :dimensions => {:x => 144, :y => 200}, :output_files => {:save_path => "#{Rails.root.join('public/uploads/test/output/')}", :save_name => "this_is_a_test_2"})