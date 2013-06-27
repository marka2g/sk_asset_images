class CreateAssetImages < ActiveRecord::Migration
  def change
    create_table :asset_images do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
