class ImageType < ActiveRecord::Base
  attr_accessible :name, :crop_x, :crop_y
  has_and_belongs_to_many :celebs
  has_and_belongs_to_many :titles, :join_table => 'titles_image_types'
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
end