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

ActiveRecord::Schema.define(version: 2020_02_20_140208) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nick_name", null: false
    t.string "phone_number", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.integer "fotsal_experience", null: false
    t.integer "soccer_experience", null: false
    t.text "introduction"
    t.string "user_image_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_end_users_on_deleted_at"
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "grop_users", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "city", null: false
    t.text "place"
    t.integer "category", null: false
    t.integer "male_member", null: false
    t.integer "female_member", null: false
    t.integer "average_age", null: false
    t.integer "level", null: false
    t.text "group_introduction", null: false
    t.string "group_image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchmake_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "matchmake_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchmake_favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "matchmake_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchmakes", force: :cascade do |t|
    t.string "group_id", null: false
    t.string "title", null: false
    t.date "day", null: false
    t.time "time", null: false
    t.string "money", null: false
    t.text "place", null: false
    t.integer "category", null: false
    t.integer "capacity", null: false
    t.integer "level", null: false
    t.integer "on_recruit", default: 1, null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teammate_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "teammate_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teammate_favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "teammate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teammates", force: :cascade do |t|
    t.integer "group_id", null: false
    t.text "schedule", null: false
    t.string "title", null: false
    t.string "money", null: false
    t.integer "level", null: false
    t.boolean "on_recruit", default: true, null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
