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

ActiveRecord::Schema.define(version: 2019_08_09_132629) do

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patient_id"
    t.integer "room_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["room_id"], name: "index_appointments_on_room_id"
  end

  create_table "beds", force: :cascade do |t|
    t.integer "beds"
    t.integer "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_beds_on_ward_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "bill"
    t.integer "stay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stay_id"], name: "index_bills_on_stay_id"
  end

  create_table "clerks", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_clerks_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clerks_on_reset_password_token", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "spec"
    t.datetime "hours"
    t.integer "fees"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_doctors_on_department_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "weight"
    t.string "dis"
    t.string "phone"
    t.text "address"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_patients_on_department_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "time"
    t.string "duty"
    t.string "floor"
    t.integer "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_staffs_on_ward_id"
  end

  create_table "stays", force: :cascade do |t|
    t.datetime "a_time"
    t.datetime "d_time"
    t.integer "patient_id"
    t.integer "ward_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_stays_on_doctor_id"
    t.index ["patient_id"], name: "index_stays_on_patient_id"
    t.index ["ward_id"], name: "index_stays_on_ward_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "wards_name"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_wards_on_department_id"
  end

end
