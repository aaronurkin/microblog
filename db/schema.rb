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

ActiveRecord::Schema.define(version: 2022_02_06_112256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "content", limit: 140, null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_followers", primary_key: ["user_id", "follower_id"], force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "follower_id", null: false
    t.date "followed_at", default: -> { "now()" }, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "full_name", limit: 71, null: false
    t.string "nickname", limit: 50, null: false
    t.string "email", limit: 255, null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "unique_emails", unique: true
    t.index ["full_name"], name: "index_users_on_full_name"
    t.index ["nickname"], name: "unique_nicknames", unique: true
  end

  add_foreign_key "posts", "users"
  add_foreign_key "user_followers", "users"
  add_foreign_key "user_followers", "users", column: "follower_id"
end
