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

ActiveRecord::Schema.define(version: 20161215233333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armies", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "games", force: :cascade do |t|
    t.boolean  "win",              null: false
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_army_id",     null: false
    t.integer  "opponent_army_id", null: false
    t.integer  "game_score"
    t.index ["location_id", "created_at"], name: "index_games_on_location_id_and_created_at", using: :btree
    t.index ["location_id"], name: "index_games_on_location_id", using: :btree
    t.index ["opponent_army_id"], name: "index_games_on_opponent_army_id", using: :btree
    t.index ["user_army_id"], name: "index_games_on_user_army_id", using: :btree
    t.index ["user_id", "created_at"], name: "index_games_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_games_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "games", "locations"
  add_foreign_key "games", "users"
end
