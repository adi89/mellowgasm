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

ActiveRecord::Schema.define(:version => 20130418054809) do

  create_table "friends", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "motivations", :force => true do |t|
    t.string   "desire"
    t.string   "categoryId"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "gender"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "venue_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users_motivations", :force => true do |t|
    t.integer "user_id"
    t.integer "motivation_id"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "rating",                    :default => 0.0
    t.integer  "total_votes",               :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "location_id"
    t.integer  "motivation_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "twitter",                   :default => ""
    t.string   "phone"
    t.text     "crossStreet"
    t.string   "foursquare_identification"
    t.string   "venue_url",                 :default => ""
    t.integer  "distance"
    t.float    "ratio",                     :default => 0.0
    t.float    "foursquare_rating",         :default => 0.0
    t.float    "checkins",                  :default => 0.0
  end

end
