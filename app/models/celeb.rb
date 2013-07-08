class Celeb < ActiveRecord::Base
  attr_accessible :name, :image_attributes

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true
end
