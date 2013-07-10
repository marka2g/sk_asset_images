class ProcessedImage < ActiveRecord::Base
  belongs_to :asset_image
  belongs_to :image_type
end