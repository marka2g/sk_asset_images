class Image < ActiveRecord::Base
	mount_uploader :asset_image, AssetImageUploader
  attr_accessible :asset_image, :name

  belongs_to :imageable, :polymorphic => true
  has_many :processed_images
  has_many :image_types, :through => :processed_images
end