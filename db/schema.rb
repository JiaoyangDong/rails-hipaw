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

ActiveRecord::Schema[7.0].define(version: 2022_08_09_023749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "date_and_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_bookings_on_pet_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "species"
    t.text "description"
    t.string "fur_type"
    t.string "age"
    t.string "sex"
    t.string "image_url"
    t.string "district"
    t.boolean "adopted_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "wechat_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "open_id"
  end

  add_foreign_key "bookings", "pets"
  add_foreign_key "bookings", "users"
  add_foreign_key "pets", "users"
end
