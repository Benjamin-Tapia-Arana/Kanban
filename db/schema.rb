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

ActiveRecord::Schema[7.1].define(version: 2024_06_11_181516) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.bigint "creator_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_boards_on_creator_id"
    t.index ["team_id"], name: "index_boards_on_team_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "priority"
    t.bigint "creator_id"
    t.bigint "assignee_id"
    t.bigint "status_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_cards_on_assignee_id"
    t.index ["creator_id"], name: "index_cards_on_creator_id"
    t.index ["status_list_id"], name: "index_cards_on_status_list_id"
  end

  create_table "status_lists", force: :cascade do |t|
    t.string "title"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_status_lists_on_board_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_teams_on_creator_id"
  end

  create_table "tu_linkers", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_tu_linkers_on_team_id"
    t.index ["user_id"], name: "index_tu_linkers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "encrypted_password"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
  end

  add_foreign_key "boards", "teams", on_delete: :cascade
  add_foreign_key "boards", "users", column: "creator_id"
  add_foreign_key "cards", "status_lists", on_delete: :cascade
  add_foreign_key "cards", "users", column: "assignee_id"
  add_foreign_key "cards", "users", column: "creator_id"
  add_foreign_key "status_lists", "boards", on_delete: :cascade
  add_foreign_key "teams", "users", column: "creator_id"
  add_foreign_key "tu_linkers", "teams", on_delete: :cascade
  add_foreign_key "tu_linkers", "users", on_delete: :cascade
end
