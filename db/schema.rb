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

ActiveRecord::Schema.define(version: 20151214195242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["project_id"], name: "index_bookings_on_project_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "calendars", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "aasm_state"
    t.integer  "user_id"
  end

  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "shoot_date"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "role"
    t.integer  "phone_cell"
    t.integer  "phone_home"
    t.string   "company_name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "union"
    t.integer  "sin"
    t.date     "birthday"
    t.string   "gender"
    t.string   "ethnic_origin"
    t.string   "nationality"
    t.string   "hair"
    t.string   "eyes"
    t.float    "height"
    t.float    "weight"
    t.float    "dress"
    t.float    "bust"
    t.float    "waist"
    t.float    "hips"
    t.float    "shoe"
    t.float    "jacket"
    t.float    "sleeve"
    t.float    "neck"
    t.float    "inseam"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_id"
    t.string   "image"
    t.json     "photos"
    t.json     "pictures"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["project_id"], name: "index_users_on_project_id", using: :btree

  add_foreign_key "bookings", "projects"
  add_foreign_key "bookings", "users"
  add_foreign_key "calendars", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "users", "projects"
end
