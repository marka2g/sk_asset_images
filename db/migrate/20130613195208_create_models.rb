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

    create_table :celebs_image_types, id: false do |t|
      t.belongs_to :celeb
      t.belongs_to :image_type
    end

    create_table :titles_image_types, id: false do |t|
      # t.belongs_to :title
      # t.belongs_to :image_type
      t.integer :title_id, :image_type_id
    end

   create_table :images do |t|
      t.string :name
      t.references :attachable, polymorphic: true
      t.timestamps
    end
    add_index :images, [:attachable_id, :attachable_type]

    create_table :image_types do |t|
      t.string :name
      t.integer :crop_x
      t.integer :crop_y
      t.timestamps
    end
  end
end
