class ProcessedImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :image_type
end