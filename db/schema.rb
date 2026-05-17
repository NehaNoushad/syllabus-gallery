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

ActiveRecord::Schema[8.1].define(version: 2026_05_17_191621) do
  create_table "degree_plans", force: :cascade do |t|
    t.string "branch"
    t.datetime "created_at", null: false
    t.string "scheme"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_degree_plans_on_user_id"
  end

  create_table "plan_selections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "degree_plan_id", null: false
    t.string "elective_group", null: false
    t.integer "subject_id", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_plan_id", "elective_group"], name: "index_plan_selections_on_degree_plan_id_and_elective_group", unique: true
    t.index ["degree_plan_id"], name: "index_plan_selections_on_degree_plan_id"
    t.index ["subject_id"], name: "index_plan_selections_on_subject_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "branch"
    t.string "category"
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "credits"
    t.string "elective_group"
    t.string "kind"
    t.string "name"
    t.string "scheme"
    t.integer "semester"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "degree_plans", "users"
  add_foreign_key "plan_selections", "degree_plans"
  add_foreign_key "plan_selections", "subjects"
  add_foreign_key "sessions", "users"
end
