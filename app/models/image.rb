class Image < ActiveRecord::Base
	mount_uploader :asset_image, AssetImageUploader
  attr_accessible :asset_image, :name, :image_type_id, :title_id, :celeb_id
  # has_many :image_types
  has_one :image_type
end