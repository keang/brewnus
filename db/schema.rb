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

ActiveRecord::Schema.define(version: 20140130211334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brewees", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "invite"
    t.integer  "inviter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brewers", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "inviter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirm_password"
  end

  add_index "brewers", ["inviter_id"], name: "index_brewers_on_inviter_id", using: :btree

  create_table "brews", force: true do |t|
    t.string   "name"
    t.float    "liters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: true do |t|
    t.integer  "brew_id"
    t.integer  "brewer_id"
    t.integer  "place_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["brew_id"], name: "index_stocks_on_brew_id", using: :btree
  add_index "stocks", ["brewer_id"], name: "index_stocks_on_brewer_id", using: :btree
  add_index "stocks", ["place_id"], name: "index_stocks_on_place_id", using: :btree

end
