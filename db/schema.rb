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

ActiveRecord::Schema.define(version: 20170522141212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.boolean "superuser", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartaments", force: :cascade do |t|
    t.string "number", null: false
    t.float "balance", default: 0.0, null: false
    t.datetime "checkin", null: false
    t.datetime "checkout", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_apartaments_on_users_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "mac", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "apartaments_id"
    t.index ["apartaments_id"], name: "index_devices_on_apartaments_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apartaments", "users", column: "users_id"
  add_foreign_key "devices", "apartaments", column: "apartaments_id"
end
