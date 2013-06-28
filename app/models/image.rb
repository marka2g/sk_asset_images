class Image < ActiveRecord::Base
	mount_uploader :asset_image, ImageUploader
  attr_accessible :asset_image, :name
end
# class Image < ActiveRecord::Base
# 	mount_uploader :asset_image, AssetImageUploader
#   attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
#   attr_accessible :name, :path, :asset_image, :crop_x, :crop_y, :crop_w, :crop_h
#   after_update :crop_asset_image

#   belongs_to :title
#   belongs_to :celeb
#   belongs_to :image_type

#   def crop_asset_image
#     asset_image.recreate_versions! if crop_x.present?
#   end

# end
