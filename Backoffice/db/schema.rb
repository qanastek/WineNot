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

ActiveRecord::Schema.define(version: 2020_11_24_004344) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "createdAt"
    t.datetime "lastEdit"
    t.integer "user_id", null: false
    t.integer "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["wine_id"], name: "index_comments_on_wine_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stars"
    t.datetime "createdAt"
    t.datetime "lastEdit"
    t.integer "user_id", null: false
    t.integer "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["wine_id"], name: "index_reviews_on_wine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "email"
    t.datetime "last_login"
    t.datetime "date_joined"
    t.boolean "is_superuser"
    t.boolean "is_staff"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wine_colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wine_makers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "wine_color_id", null: false
    t.integer "vintage"
    t.integer "wine_maker_id", null: false
    t.string "country"
    t.string "region"
    t.string "appellation"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wine_color_id"], name: "index_wines_on_wine_color_id"
    t.index ["wine_maker_id"], name: "index_wines_on_wine_maker_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "wines"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "wines"
  add_foreign_key "wines", "wine_colors"
  add_foreign_key "wines", "wine_makers"
end
