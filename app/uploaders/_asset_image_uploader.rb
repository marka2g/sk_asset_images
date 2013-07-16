class AssetImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

#   def initialize(model = nil, mounted_as = nil)
# binding.pry
#     initial_image_types = model.attachable.image_types
#     version_names = initial_image_types.collect(&:name)


#     # model_image_types = ImageType.where(name: [version_names])

#     # initial_image_types.each {|t| version t.name.to_sym { process :resize_to_fill => [t.crop_x, t.crop_y]}}
#     # super

  
#     model_image_types.each do |type|
#       # version type.name.to_sym do
#         process :resize_to_fill => [type.crop_x, type.crop_y]
#       # end
#     end

#   end


  # ImageType.all.each do |type|
  #   version type.name.to_sym do
  #     process :resize_to_fill => [type.crop_x, type.crop_y]
  #   end
  # end

  def store_dir
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # @initial_image_types.each {|t| version type.name.to_sym { process :resize_to_fill => [type.crop_x, type.crop_y]}}

  # @model.attachable.image_types.each do |type|
  #   version type.name.to_sym do
  #     process :resize_to_fill => [type.crop_x, type.crop_y]
  #   end
  # end



  # def initialize(model = nil, mounted_as = nil)
  #   if model
  #     self.class.class_eval do
  #       model.attachable.image_types.each do |type|
  #         version type.name.to_sym do
  #           process :resize_to_fill => [type.crop_x, type.crop_y]
  #         end
  #       end
  #     end
  #   end

  #   super
  # end

#   def initialize(model = nil, mounted_as = nil)
# binding.pry
#     if model
#       model.attachable.image_types.each do |type|
#         "version" type.name.to_sym do
#           process :resize_to_fill => [type.crop_x, type.crop_y]
#         end      
#       end
#     end
#   end

end
