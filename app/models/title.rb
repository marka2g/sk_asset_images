class Title < ActiveRecord::Base
  attr_accessible :name, :images_attributes

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true
end
