class Image < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :filename
  attr_accessor :image, :file, :filename
  belongs_to :attachable, polymorphic: true
 
  mount_uploader :filename, ImageUploader
  validates_processing_of :filename
  
  def image_types
    klass = self.attachable_type.constantize
    klass.find self.attachable_id.image_types
  end

end