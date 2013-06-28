class CreateModels < ActiveRecord::Migration
  def change
    create_table :celebs do |t|
      t.string :name
      t.timestamps
    end
    add_index :celebs, :name, :unique => true

    create_table :titles do |t|
      t.string :name
      t.timestamps
    end
    add_index :titles, :name, :unique => true

    create_table :images do |t|
      t.has_many :image_types
      t.belongs_to :celeb
      t.belongs_to :title
      t.string :name
      t.string :path
      t.string :asset_image
      t.timestamps
    end

    create_table :image_types do |t|
      t.belongs_to :image
      t.string :name
      t.string :path
      t.integer :crop_x
      t.integer :crop_y
      t.timestamps
    end

  end
end
