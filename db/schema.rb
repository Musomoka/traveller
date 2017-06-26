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

ActiveRecord::Schema.define(version: 20170626092631) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "place_id",     limit: 4
    t.string   "phy_address1", limit: 255
    t.string   "phy_address2", limit: 255
    t.string   "phy_address3", limit: 255
    t.string   "region",       limit: 255
    t.string   "city",         limit: 255
    t.string   "country",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "latitude",     limit: 4
    t.integer  "longatude",    limit: 4
  end

  add_index "addresses", ["place_id"], name: "index_addresses_on_place_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "content",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "gallaries", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "link",               limit: 255
    t.boolean  "main_image"
    t.integer  "place_id",           limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "gallaries", ["place_id"], name: "index_gallaries_on_place_id", using: :btree

  create_table "guides", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "avatar",          limit: 255
    t.integer  "organisation_id", limit: 4
    t.text     "bio",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "guides", ["organisation_id"], name: "index_guides_on_organisation_id", using: :btree
  add_index "guides", ["user_id"], name: "index_guides_on_user_id", using: :btree

  create_table "itineraries", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.integer  "place_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "itineraries", ["place_id"], name: "index_itineraries_on_place_id", using: :btree
  add_index "itineraries", ["tour_id"], name: "index_itineraries_on_tour_id", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "description",       limit: 65535
    t.string   "logo",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "place_id_id",        limit: 4
    t.integer  "place_id",           limit: 4
  end

  add_index "photos", ["place_id"], name: "index_photos_on_place_id", using: :btree
  add_index "photos", ["place_id_id"], name: "index_photos_on_place_id_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "gprs",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "category",    limit: 255
    t.text     "description", limit: 65535
    t.string   "url",         limit: 255
  end

  create_table "places_photos", force: :cascade do |t|
    t.integer "place_id", limit: 4
    t.integer "photo_id", limit: 4
  end

  add_index "places_photos", ["photo_id"], name: "index_places_photos_on_photo_id", using: :btree
  add_index "places_photos", ["place_id"], name: "index_places_photos_on_place_id", using: :btree

  create_table "tours", force: :cascade do |t|
    t.string   "tour_name",   limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.integer  "guide_id",    limit: 4
    t.integer  "place_id",    limit: 4
  end

  add_index "tours", ["category_id"], name: "index_tours_on_category_id", using: :btree
  add_index "tours", ["guide_id"], name: "index_tours_on_guide_id", using: :btree
  add_index "tours", ["place_id"], name: "index_tours_on_place_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "places"
  add_foreign_key "gallaries", "places"
  add_foreign_key "guides", "organisations"
  add_foreign_key "guides", "users"
  add_foreign_key "itineraries", "places"
  add_foreign_key "itineraries", "tours"
  add_foreign_key "photos", "places"
  add_foreign_key "places_photos", "photos"
  add_foreign_key "places_photos", "places"
  add_foreign_key "tours", "categories"
  add_foreign_key "tours", "guides"
  add_foreign_key "tours", "places"
end
