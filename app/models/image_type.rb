class ImageType < ActiveRecord::Base
  attr_accessible :name, :crop_x, :crop_y

  # belongs_to :image

end