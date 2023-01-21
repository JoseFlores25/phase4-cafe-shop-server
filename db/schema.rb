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

ActiveRecord::Schema.define(version: 2023_01_21_133505) do

  create_table "coffees", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coffees_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "coffee_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coffee_id"], name: "index_feedbacks_on_coffee_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.integer "coffee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coffee_id"], name: "index_toppings_on_coffee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "coffees", "users"
  add_foreign_key "feedbacks", "coffees"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "toppings", "coffees"
end
