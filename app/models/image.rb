class Image < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :name
  # attr_accessor :image, :file, :name
  attr_accessor :image, :file, :name, :crop_x, :crop_y, :crop_w, :crop_h
  belongs_to :attachable, polymorphic: true

  mount_uploader :name, ImageUploader
  # validates_processing_of :name
end