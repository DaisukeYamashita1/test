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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_10_11_044613) do

  create_table "users", force: :cascade do |t|
=======
ActiveRecord::Schema.define(version: 2021_11_17_112216) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contents", force: :cascade do |t|
    t.text "title"
    t.string "path"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "chapter_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "user_name"
>>>>>>> origin/main
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "agreement"
<<<<<<< HEAD
    t.text "user_name"
    t.string "public_uid"
=======
    t.string "public_uid"
    t.boolean "allowed", default: false, null: false
>>>>>>> origin/main
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
  end

end
