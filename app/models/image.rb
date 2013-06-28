class Image < ActiveRecord::Base
	mount_uploader :asset_image, AssetImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :name, :path, :version, :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_asset_image

  belongs_to :title
  belongs_to :celeb

  def crop_asset_image
    asset_image.recreate_versions! if crop_x.present?
  end

end
