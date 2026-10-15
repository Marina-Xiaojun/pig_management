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

ActiveRecord::Schema[7.2].define(version: 2026_10_14_044705) do
  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "employee_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employees_on_employee_id", unique: true
  end

  create_table "introductions", force: :cascade do |t|
    t.integer "pig_house_id", null: false
    t.date "introduction_date"
    t.integer "head_count"
    t.integer "age_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pig_house_id"], name: "index_introductions_on_pig_house_id"
  end

  create_table "pig_houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer "pig_house_id", null: false
    t.integer "destination_id", null: false
    t.date "shipment_date"
    t.integer "head_count"
    t.integer "age_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_shipments_on_destination_id"
    t.index ["pig_house_id"], name: "index_shipments_on_pig_house_id"
  end

  add_foreign_key "introductions", "pig_houses"
  add_foreign_key "shipments", "destinations"
  add_foreign_key "shipments", "pig_houses"
end
