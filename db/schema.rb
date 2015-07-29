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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150727151155) do

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "photo_url"
    t.string   "instagram_handle"
    t.string   "twitter_handle"
    t.string   "facebook_handle"
    t.string   "instagram_uid"
    t.string   "twitter_uid"
    t.string   "facebook_uid"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "facebook_name"
    t.string   "facebook_uid"
    t.string   "facebook_provider"
    t.string   "facebook_auth_token"
    t.string   "twitter_name"
    t.string   "twitter_uid"
    t.string   "twitter_provider"
    t.string   "twitter_auth_token"
    t.string   "instagram_name"
    t.string   "instagram_uid"
    t.string   "instagram_provider"
    t.string   "instagram_auth_token"
    t.string   "photo_url"
    t.integer  "person_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
