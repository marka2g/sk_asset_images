class Image < ActiveRecord::Base
	mount_uploader :asset_image, AssetImageUploader
  attr_accessible :asset_image, :name, :title_id, :celeb_id
end

