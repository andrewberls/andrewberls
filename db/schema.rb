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

ActiveRecord::Schema.define(version: 20180809163132) do

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "email"
    t.text     "message"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "status"
    t.integer  "user_id"
    t.string   "url_alias",    limit: 255
    t.datetime "published_at"
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_hash",   limit: 255
    t.string   "password_salt",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name",       limit: 255
    t.integer  "permissions"
    t.string   "password_digest"
  end

end
