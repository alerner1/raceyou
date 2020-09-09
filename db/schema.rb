# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_070755) do

  create_table "friendships", force: :cascade do |t|
    t.integer "runner_id"
    t.integer "friend_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["runner_id"], name: "index_friendships_on_runner_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "race_type"
    t.string "length"
    t.integer "elevation_increase"
    t.integer "elevation_decrease"
    t.datetime "expiration_date"
  end

  create_table "rank_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "runner_id", null: false
    t.integer "race_id", null: false
    t.boolean "completed", default: false
    t.integer "place"
    t.integer "finish_time"
    t.index ["race_id"], name: "index_registrations_on_race_id"
    t.index ["runner_id"], name: "index_registrations_on_runner_id"
  end

  create_table "runners", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "rank_category_id"
    t.integer "rank"
    t.index ["rank_category_id"], name: "index_runners_on_rank_category_id"
  end

  add_foreign_key "friendships", "runners"
  add_foreign_key "registrations", "races"
  add_foreign_key "registrations", "runners"
  add_foreign_key "runners", "rank_categories"
end
