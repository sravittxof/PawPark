# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_01_060956) do

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "breed"
    t.string "size"
    t.string "disposition"
    t.string "favorite_toy"
    t.string "favorite_game"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "hours"
    t.boolean "open"
    t.boolean "small_dog_area"
    t.integer "current_visitors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playdates", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  create_table "visit_playdates", force: :cascade do |t|
    t.integer "visit_id", null: false
    t.integer "playdate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playdate_id"], name: "index_visit_playdates_on_playdate_id"
    t.index ["visit_id"], name: "index_visit_playdates_on_visit_id"
  end

  create_table "visits", force: :cascade do |t|
    t.boolean "active_visit"
    t.integer "dog_id", null: false
    t.integer "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_visits_on_dog_id"
    t.index ["park_id"], name: "index_visits_on_park_id"
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "visit_playdates", "playdates"
  add_foreign_key "visit_playdates", "visits"
  add_foreign_key "visits", "dogs"
  add_foreign_key "visits", "parks"
end
