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

ActiveRecord::Schema[7.1].define(version: 2025_11_25_022047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fights", force: :cascade do |t|
    t.bigint "user_map_level_id", null: false
    t.string "status"
    t.string "enemy_name"
    t.string "enemy_sprite"
    t.integer "enemy_hitpoints"
    t.integer "player_hitpoints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_map_level_id"], name: "index_fights_on_user_map_level_id"
  end

  create_table "map_levels", force: :cascade do |t|
    t.text "story_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "type"
    t.string "question"
    t.string "answers", default: [], array: true
    t.integer "correct_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_map_levels", force: :cascade do |t|
    t.bigint "map_level_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_level_id"], name: "index_user_map_levels_on_map_level_id"
    t.index ["user_id"], name: "index_user_map_levels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "character_name"
    t.integer "hitpoints"
    t.integer "experience_points"
    t.integer "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fights", "user_map_levels"
  add_foreign_key "user_map_levels", "map_levels"
  add_foreign_key "user_map_levels", "users"
end
