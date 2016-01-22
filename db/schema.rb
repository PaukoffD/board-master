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

ActiveRecord::Schema.define(version: 20160122074948) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_mainuser_id"
    t.integer  "subcategory"
    t.string   "slug"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "parent_id"
    t.integer  "count",                default: 0
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "notice"
    t.text     "text"
    t.integer  "price"
    t.integer  "city_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "storage_ads"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "state",                default: "pending_review"
    t.integer  "views_count",          default: 0
    t.string   "slug"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "category_id"
    t.string   "avatar1_file_name"
    t.string   "avatar1_content_type"
    t.integer  "avatar1_file_size"
    t.datetime "avatar1_updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmp_notices", force: :cascade do |t|
    t.string   "notice"
    t.text     "text"
    t.integer  "price"
    t.integer  "city"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "storage_ads"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "state",               default: "pending_review"
    t.integer  "views_count",         default: 0
    t.string   "slug"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "tmpcats", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_mainuser_id"
    t.integer  "subcategory"
    t.string   "slug"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tmpnotices", force: :cascade do |t|
    t.string   "notice"
    t.text     "text"
    t.integer  "price"
    t.integer  "city"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "storage_ads"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "state",               default: "pending_review"
    t.integer  "views_count",         default: 0
    t.string   "slug"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "choice"
    t.string   "ref_page"
    t.string   "ref_img"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
