class ImageType < ActiveRecord::Base
  attr_accessible :name, :crop_x, :crop_y
  has_many :processed_images
  has_many :images, :through => :processed_images
end