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

ActiveRecord::Schema[7.1].define(version: 2024_03_21_030001) do
  create_table "birds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "bird_type", null: false
    t.text "description", null: false
    t.string "bird_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_favorites_on_pet_id"
    t.index ["user_id", "pet_id"], name: "index_favorites_on_user_id_and_pet_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "pet_chat_in_rooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "chat", null: false
    t.bigint "room_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_chat_in_rooms_on_pet_id"
    t.index ["room_id"], name: "index_pet_chat_in_rooms_on_room_id"
  end

  create_table "pet_in_rooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id", "room_id"], name: "index_pet_in_rooms_on_pet_id_and_room_id", unique: true
    t.index ["pet_id"], name: "index_pet_in_rooms_on_pet_id"
    t.index ["room_id"], name: "index_pet_in_rooms_on_room_id"
  end

  create_table "pets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level", default: 1, null: false
    t.integer "experience_point", default: 0, null: false
    t.integer "hungry_score", default: 100, null: false
    t.boolean "alive", default: true, null: false
    t.bigint "user_id", null: false
    t.bigint "bird_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bird_id"], name: "index_pets_on_bird_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "rooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "entry_limit", default: 6, null: false
    t.string "room_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.integer "experience_point", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocabs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "word", null: false
    t.integer "frequency", default: 0, null: false
    t.string "pos", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_vocabs_on_pet_id"
  end

  add_foreign_key "favorites", "pets"
  add_foreign_key "favorites", "users"
  add_foreign_key "pet_chat_in_rooms", "pets"
  add_foreign_key "pet_chat_in_rooms", "rooms"
  add_foreign_key "pet_in_rooms", "pets"
  add_foreign_key "pet_in_rooms", "rooms"
  add_foreign_key "pets", "birds"
  add_foreign_key "pets", "users"
  add_foreign_key "vocabs", "pets"
end
