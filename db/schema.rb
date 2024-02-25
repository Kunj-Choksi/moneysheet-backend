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

ActiveRecord::Schema[7.0].define(version: 2022_03_19_193532) do
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.float "total_balance"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_uid"
    t.string "google_photo_url"
  end

  create_table "master_categories", force: :cascade do |t|
    t.string "name"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_stores", force: :cascade do |t|
    t.string "name"
    t.integer "status_id"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "store_id"
    t.datetime "datetime"
    t.float "amount"
    t.integer "purchase_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id"
    t.text "comments"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
