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
      t.string :name
      t.string :asset_image
      t.references :imageable, polymorphic: true
      t.timestamps
    end
    add_index :images, [:imageable_id, :imageable_type]

    create_table :image_types do |t|
      t.string :name
      t.integer :crop_x
      t.integer :crop_y
      t.timestamps
    end

    create_table :processed_images do |t|
      t.belongs_to :image
      t.belongs_to :image_type
      t.timestamps
    end

  end
end