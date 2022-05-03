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

ActiveRecord::Schema[7.0].define(version: 2022_05_03_013047) do
  create_table "confirmed_barriers", primary_key: "run_id", id: { type: :bigint, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "bracket_number", limit: 1, null: false, unsigned: true
    t.integer "horse_number", limit: 1, null: false, unsigned: true
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["run_id"], name: "run_index"
  end

  create_table "courses", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "racecourse_id", limit: 1, null: false, unsigned: true
    t.integer "coursetype_id", limit: 1, null: false, unsigned: true
    t.integer "course_length", null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["course_length"], name: "course_length_index"
    t.index ["coursetype_id"], name: "coursetype_index"
    t.index ["racecourse_id"], name: "racecourse_index"
  end

  create_table "coursetypes", id: { type: :integer, limit: 1, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
  end

  create_table "helds", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "racecourse_id", limit: 1, null: false, unsigned: true
    t.integer "held_year", limit: 1, null: false, unsigned: true
    t.integer "held_month", limit: 1, null: false, unsigned: true
    t.integer "held_day", limit: 1, null: false, unsigned: true
    t.integer "number_of_times", limit: 1, null: false, unsigned: true
    t.integer "number_of_days", limit: 1, null: false, unsigned: true
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["number_of_days"], name: "number_of_days_index"
    t.index ["number_of_times"], name: "number_of_times_index"
    t.index ["racecourse_id"], name: "racecourse_index"
  end

  create_table "horses", id: { type: :bigint, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.integer "sex_id", limit: 1, null: false, unsigned: true
    t.timestamp "birthday", null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["sex_id"], name: "sex_index"
  end

  create_table "jockeys", id: { type: :bigint, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
  end

  create_table "racecourses", id: { type: :integer, limit: 1, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
  end

  create_table "races", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "held_id", null: false, unsigned: true
    t.integer "course_id", null: false, unsigned: true
    t.integer "race_round", limit: 1, null: false
    t.string "name", limit: 20, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["course_id"], name: "course_index"
    t.index ["held_id"], name: "helds_index"
    t.index ["name"], name: "name", type: :fulltext
    t.index ["name"], name: "name_fulltext_idx", type: :fulltext
  end

  create_table "runs", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "horse_id", null: false, unsigned: true
    t.bigint "race_id", null: false, unsigned: true
    t.float "burden_weight", null: false
    t.bigint "jockey_id", null: false, unsigned: true
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["horse_id"], name: "horse_index"
    t.index ["jockey_id"], name: "jockey_index"
    t.index ["race_id"], name: "race_index"
  end

  create_table "sex", id: { type: :integer, limit: 1, unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
  end

  add_foreign_key "confirmed_barriers", "runs", name: "confirmed_barriers_ibfk_1", on_delete: :cascade
  add_foreign_key "courses", "coursetypes", name: "courses_ibfk_2", on_delete: :cascade
  add_foreign_key "courses", "racecourses", name: "courses_ibfk_1", on_delete: :cascade
  add_foreign_key "helds", "racecourses", name: "helds_ibfk_1", on_delete: :cascade
  add_foreign_key "horses", "sex", name: "horses_ibfk_1", on_delete: :cascade
  add_foreign_key "races", "courses", name: "races_ibfk_1", on_delete: :cascade
  add_foreign_key "races", "helds", name: "races_ibfk_2", on_delete: :cascade
  add_foreign_key "runs", "horses", name: "runs_ibfk_1", on_delete: :cascade
  add_foreign_key "runs", "jockeys", name: "runs_ibfk_3", on_delete: :cascade
  add_foreign_key "runs", "races", name: "runs_ibfk_2", on_delete: :cascade
end
