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

ActiveRecord::Schema.define(version: 20190308084259) do

  create_table "instructors", force: :cascade do |t|
    t.string "instructorid", null: false
    t.string "departmentname"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructorid"], name: "index_instructors_on_instructorid", unique: true
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "studentid", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studentid"], name: "index_students_on_studentid", unique: true
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "citizenid", null: false
    t.string "username"
    t.string "password"
    t.string "email"
    t.integer "usertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citizenid"], name: "index_users_on_citizenid", unique: true
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", force: :cascade do |t|
    t.string "usertype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
