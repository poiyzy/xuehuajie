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

ActiveRecord::Schema.define(:version => 20120807160705) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "active",            :default => true
  end

  add_index "avatars", ["user_id"], :name => "index_avatars_on_user_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.string   "type"
    t.string   "object"
    t.string   "target"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "read"
  end

  add_index "notifications", ["read"], :name => "index_notifications_on_read"

  create_table "pictures", :force => true do |t|
    t.integer  "gid"
    t.string   "description"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["gid"], :name => "index_pictures_on_gid"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "image_url"
    t.string   "image_url_middle"
    t.string   "image_url_small"
    t.string   "gender"
    t.date     "birthday"
    t.text     "bio"
    t.string   "user_name"
    t.integer  "follower_num"
    t.integer  "heat"
    t.boolean  "searchable",       :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "state"
    t.string   "city"
    t.string   "school"
    t.string   "avatar"
  end

  add_index "profiles", ["gender"], :name => "index_profiles_on_gender"
  add_index "profiles", ["heat"], :name => "index_profiles_on_heat"
  add_index "profiles", ["searchable"], :name => "index_profiles_on_searchable"
  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"
  add_index "profiles", ["user_name"], :name => "index_profiles_on_user_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "getting_started",        :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
