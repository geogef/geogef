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

ActiveRecord::Schema[7.1].define(version: 2024_06_18_164116) do
  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "flag_url"
    t.integer "population"
    t.float "surface_area"
    t.string "capital"
    t.string "currency"
    t.string "languages"
    t.text "interesting_fact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer "duration"
    t.integer "lesson_id"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["lesson_id"], name: "index_exams_on_lesson_id"
    t.index ["level_id"], name: "index_exams_on_level_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.integer "topic_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "num_levels"
    t.index ["lesson_id"], name: "index_lessons_on_lesson_id"
    t.index ["topic_id"], name: "index_lessons_on_topic_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "number"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["lesson_id"], name: "index_levels_on_lesson_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "content"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topic_id"
    t.string "imagepath"
    t.index ["level_id"], name: "index_materials_on_level_id"
    t.index ["topic_id"], name: "index_materials_on_topic_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "response"
    t.integer "topics_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topics_id"], name: "index_options_on_topics_id"
  end

  create_table "progress_lessons", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.integer "level_id"
    t.boolean "is_completed", default: false
    t.index ["lesson_id"], name: "index_progress_lessons_on_lesson_id"
    t.index ["level_id"], name: "index_progress_lessons_on_level_id"
    t.index ["user_id"], name: "index_progress_lessons_on_user_id"
  end

  create_table "qas", force: :cascade do |t|
    t.integer "questions_id"
    t.integer "options_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagepath"
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_qas_on_exam_id"
    t.index ["options_id"], name: "index_qas_on_options_id"
    t.index ["questions_id"], name: "index_qas_on_questions_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "topic_id"
    t.integer "exams_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exams_id"], name: "index_questions_on_exams_id"
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.float "app_progress"
    t.integer "highest_streak"
    t.integer "completed_lessons"
    t.integer "geogems"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "current_streak"
  end

  add_foreign_key "exams", "lessons"
  add_foreign_key "exams", "levels"
  add_foreign_key "lessons", "lessons"
  add_foreign_key "lessons", "topics"
  add_foreign_key "levels", "lessons"
  add_foreign_key "materials", "levels"
  add_foreign_key "materials", "topics"
  add_foreign_key "options", "topics", column: "topics_id"
  add_foreign_key "progress_lessons", "lessons"
  add_foreign_key "progress_lessons", "levels"
  add_foreign_key "progress_lessons", "users"
  add_foreign_key "qas", "exams"
  add_foreign_key "questions", "exams", column: "exams_id"
  add_foreign_key "questions", "topics"
end
