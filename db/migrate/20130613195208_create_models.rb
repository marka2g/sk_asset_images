class CreateModels < ActiveRecord::Migration
  def change
    create_table :celebs do |t|
      t.string :name
    end
    add_index :celebs, :name, :unique => true

    create_table :titles do |t|
      t.string :name
    end
    add_index :titles, :name, :unique => true
  end
end
