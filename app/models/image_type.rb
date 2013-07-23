class ImageType < ActiveRecord::Base
	# attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	# after_update :crop_image_type

  attr_accessible :name
  has_and_belongs_to_many :celebs
  has_and_belongs_to_many :titles, :join_table => 'titles_image_types'
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
end