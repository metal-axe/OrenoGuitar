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

ActiveRecord::Schema.define(version: 2020_03_03_151438) do

  create_table "guitars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.string "brand"
    t.string "model"
    t.string "neck_type"
    t.string "neck_wood"
    t.string "body_type"
    t.string "body_wood"
    t.string "fret"
    t.string "number_of_fret"
    t.string "fret_wood"
    t.string "scale"
    t.string "nut"
    t.string "bridge"
    t.string "string_space"
    t.string "neck_pickup"
    t.string "middle_pickup"
    t.string "bridg_pickup"
    t.string "controlls"
    t.string "tuners"
    t.string "tuning"
    t.string "string_gauge"
    t.string "string_brand"
    t.string "hardware_color"
    t.string "main_or_sub"
    t.string "others"
    t.string "comment"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guitars_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "profile"
    t.string "url"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "guitars", "users"
end
