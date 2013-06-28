class Title < ActiveRecord::Base
  mount_uploader :asset_image, AssetImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :name, :asset_image, :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_asset_image

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  has_many :images

  def crop_asset_image
    asset_image.recreate_versions! if crop_x.present?
  end
end
