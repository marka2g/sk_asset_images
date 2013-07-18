class Celeb < ActiveRecord::Base
  attr_accessible :name, :images_attributes
  attr_accessor :file
  has_many :images, as: :attachable
  has_and_belongs_to_many :image_types

  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
  accepts_nested_attributes_for :images, allow_destroy: true

end