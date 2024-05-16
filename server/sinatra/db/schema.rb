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

ActiveRecord::Schema[7.1].define(version: 2024_05_16_214002) do
  create_table "exams", force: :cascade do |t|
    t.integer "duration"
    t.integer "lesson_id"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_exams_on_lesson_id"
    t.index ["level_id"], name: "index_exams_on_level_id"
  end

  create_table "learnings", force: :cascade do |t|
    t.integer "level_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_learnings_on_level_id"
    t.index ["topic_id"], name: "index_learnings_on_topic_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.integer "topics_id"
    t.integer "lessons_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lessons_id"], name: "index_lessons_on_lessons_id"
    t.index ["topics_id"], name: "index_lessons_on_topics_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "number"
    t.integer "exam_id"
    t.integer "lessons_id"
    t.integer "learnings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_levels_on_exam_id"
    t.index ["learnings_id"], name: "index_levels_on_learnings_id"
    t.index ["lessons_id"], name: "index_levels_on_lessons_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "content"
    t.integer "learning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_id"], name: "index_materials_on_learning_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "response"
    t.integer "topics_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topics_id"], name: "index_options_on_topics_id"
  end

  create_table "progress_lessons", force: :cascade do |t|
    t.integer "users_id"
    t.integer "lessons_id"
    t.integer "levels_id"
    t.index ["lessons_id"], name: "index_progress_lessons_on_lessons_id"
    t.index ["levels_id"], name: "index_progress_lessons_on_levels_id"
    t.index ["users_id"], name: "index_progress_lessons_on_users_id"
  end

  create_table "qas", force: :cascade do |t|
    t.integer "questions_id"
    t.integer "options_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options_id"], name: "index_qas_on_options_id"
    t.index ["questions_id"], name: "index_qas_on_questions_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "topics_id"
    t.integer "exams_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exams_id"], name: "index_questions_on_exams_id"
    t.index ["topics_id"], name: "index_questions_on_topics_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  add_foreign_key "exams", "lessons"
  add_foreign_key "exams", "levels"
  add_foreign_key "learnings", "levels"
  add_foreign_key "learnings", "topics"
  add_foreign_key "lessons", "lessons", column: "lessons_id"
  add_foreign_key "lessons", "topics", column: "topics_id"
  add_foreign_key "levels", "exams"
  add_foreign_key "levels", "learnings", column: "learnings_id"
  add_foreign_key "levels", "lessons", column: "lessons_id"
  add_foreign_key "materials", "learnings"
  add_foreign_key "options", "topics", column: "topics_id"
  add_foreign_key "progress_lessons", "lessons", column: "lessons_id"
  add_foreign_key "progress_lessons", "levels", column: "levels_id"
  add_foreign_key "progress_lessons", "users", column: "users_id"
  add_foreign_key "questions", "exams", column: "exams_id"
  add_foreign_key "questions", "topics", column: "topics_id"
end
