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

ActiveRecord::Schema[7.1].define(version: 2024_04_19_015620) do
  create_table "profiles", force: :cascade do |t|
    t.string "discord_id"
    t.string "steam_id"
    t.string "du_charname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["discord_id"], name: "index_profiles_on_discord_id"
    t.index ["steam_id"], name: "index_profiles_on_steam_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  create_table "vehicle_attributes_cards", force: :cascade do |t|
    t.integer "attribute_id"
    t.string "attribute_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_data_card_id", null: false
    t.index ["vehicle_data_card_id"], name: "index_vehicle_attributes_cards_on_vehicle_data_card_id"
  end

  create_table "vehicle_data_cards", force: :cascade do |t|
    t.integer "user_id"
    t.string "design_name", null: false
    t.integer "price_blueprint"
    t.integer "price_token"
    t.integer "core_size"
    t.boolean "env_atmosphere"
    t.boolean "env_ground"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "env_space"
  end

  create_table "vehicle_features", force: :cascade do |t|
    t.integer "feature_id"
    t.string "feature_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_data_card_id", null: false
    t.index ["vehicle_data_card_id"], name: "index_vehicle_features_on_vehicle_data_card_id"
  end

  create_table "vehicle_roles", force: :cascade do |t|
    t.integer "role_id"
    t.string "role_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_data_card_id", null: false
    t.index ["vehicle_data_card_id"], name: "index_vehicle_roles_on_vehicle_data_card_id"
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "vehicle_attributes_cards", "vehicle_data_cards"
  add_foreign_key "vehicle_features", "vehicle_data_cards"
  add_foreign_key "vehicle_roles", "vehicle_data_cards"
end
