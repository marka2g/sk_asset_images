class ImageType < ActiveRecord::Base
  attr_accessible :name, :path, :crop_x, :crop_y

  belongs_to :images
end