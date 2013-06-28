class Title < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
<<<<<<< HEAD
  has_many :images

  def crop_asset_image
    asset_image.recreate_versions! if crop_x.present?
  end
end
=======
end
>>>>>>> rmagick
