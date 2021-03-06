# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130613195208) do

  create_table "celebs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "celebs", ["name"], :name => "index_celebs_on_name", :unique => true

  create_table "celebs_image_types", :id => false, :force => true do |t|
    t.integer "celeb_id"
    t.integer "image_type_id"
  end

  create_table "image_types", :force => true do |t|
    t.string   "name"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "images", ["attachable_id", "attachable_type"], :name => "index_images_on_attachable_id_and_attachable_type"

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "titles", ["name"], :name => "index_titles_on_name", :unique => true

  create_table "titles_image_types", :id => false, :force => true do |t|
    t.integer "title_id"
    t.integer "image_type_id"
  end

end
