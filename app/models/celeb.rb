class Celeb < ActiveRecord::Base
  attr_accessible :name, :images_attributes
  attr_accessor :filename, :file
  has_many :images, as: :attachable

  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
  accepts_nested_attributes_for :images, allow_destroy: true
end