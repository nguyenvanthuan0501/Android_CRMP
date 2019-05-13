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

ActiveRecord::Schema.define(version: 2019_05_13_072348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commentcrimes", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "crime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crime_id"], name: "index_commentcrimes_on_crime_id"
    t.index ["user_id"], name: "index_commentcrimes_on_user_id"
  end

  create_table "commentmissings", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "missing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["missing_id"], name: "index_commentmissings_on_missing_id"
    t.index ["user_id"], name: "index_commentmissings_on_user_id"
  end

  create_table "complaint_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "image"
    t.bigint "complaint_categories_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_categories_id"], name: "index_complaints_on_complaint_categories_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "crimes", force: :cascade do |t|
    t.string "area"
    t.string "title"
    t.string "description"
    t.datetime "time"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["category_id"], name: "index_crimes_on_category_id"
    t.index ["user_id"], name: "index_crimes_on_user_id"
  end

  create_table "hotlines", force: :cascade do |t|
    t.string "area"
    t.string "hotline_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missings", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_missings_on_user_id"
  end

  create_table "reportcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "status"
    t.integer "post_id"
    t.bigint "reportcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reportcategory_id"], name: "index_reports_on_reportcategory_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "password"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.integer "id_card_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "password_confirmation"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
