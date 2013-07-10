class Image < ActiveRecord::Base
	attr_accessible :attachable_id, :attachable_type, :filename
	attr_accessor :image, :file, :filename
	belongs_to :attachable, polymorphic: true

  has_many :processed_images
  has_many :image_types, :through => :processed_images

  mount_uploader :filename, AssetImageUploader
end