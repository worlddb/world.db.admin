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

ActiveRecord::Schema.define(:version => 20121004210237) do

  create_table "cities", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "key",                           :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id",                    :null => false
    t.integer  "region_id"
    t.integer  "pop"
    t.integer  "popm"
    t.integer  "area"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "m",          :default => false, :null => false
    t.boolean  "c",          :default => false, :null => false
    t.boolean  "d",          :default => false, :null => false
    t.integer  "city_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "key",                           :null => false
    t.string   "code",                          :null => false
    t.string   "synonyms"
    t.integer  "pop",                           :null => false
    t.integer  "area",                          :null => false
    t.integer  "country_id"
    t.boolean  "s",          :default => false, :null => false
    t.boolean  "c",          :default => false, :null => false
    t.boolean  "d",          :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "motor"
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true
  add_index "countries", ["key"], :name => "index_countries_on_key", :unique => true

  create_table "props", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "key",        :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id", :null => false
    t.integer  "pop"
    t.integer  "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["key", "country_id"], :name => "index_regions_on_key_and_country_id", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",        :null => false
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "slug",       :null => false
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["key"], :name => "index_tags_on_key", :unique => true

end
