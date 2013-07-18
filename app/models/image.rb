class Image < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :name
  attr_accessor :image, :file, :name
  belongs_to :attachable, polymorphic: true

  mount_uploader :name, ImageUploader
  # validates_processing_of :name

  def image_types
    klass = self.attachable_type.constantize
    klass.find self.attachable_id.image_types
  end

end