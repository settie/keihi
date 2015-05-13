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

ActiveRecord::Schema.define(version: 20150513154713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "length_type", default: "half", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "point",      null: false
    t.integer  "score",      null: false
    t.integer  "ranking",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position",   null: false
  end

  add_index "results", ["game_id"], name: "index_results_on_game_id", using: :btree
  add_index "results", ["user_id"], name: "index_results_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "results", "games"
  add_foreign_key "results", "users"
end
