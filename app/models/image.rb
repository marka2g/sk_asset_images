class Image < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :name
  attr_accessor :image, :file, :name
  belongs_to :attachable, polymorphic: true

  mount_uploader :name, ImageUploader
  # validates_processing_of :name
end