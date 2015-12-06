# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151206025520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template",           default: "main"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "slug"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
    t.integer "session_id"
    t.float   "raw_score",  default: 0.0
    t.float   "score",      default: 0.0
    t.float   "percentile", default: 0.0
    t.string  "status",     default: "enrolled"
  end

  create_table "exercise_categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "slug"
  end

  create_table "exercises", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.string  "instructions"
    t.string  "slug"
    t.integer "exercise_category_id"
  end

  create_table "game_categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "slug"
  end

  create_table "game_categories_games", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "game_category_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "popularity",   default: 0
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_time"
    t.text     "instructions"
  end

  create_table "games_matches", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "match_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "start_time"
    t.string   "title"
    t.string   "mode",            default: "free"
    t.integer  "capacity",        default: 100
    t.integer  "entry_count",     default: 0
    t.integer  "entry_cost"
    t.string   "status",          default: "enrolling"
    t.integer  "round_num",       default: 0
    t.datetime "next_round_time"
  end

  create_table "memory_workouts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "instructions"
    t.string "slug"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "resource_type"
    t.string   "resource_id"
    t.integer  "importance",    default: 0
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "puzzle_categories", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.string  "instructions"
    t.string  "slug"
    t.integer "count"
  end

  create_table "reactions", force: :cascade do |t|
    t.string   "reaction_type"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "entry_id"
    t.integer "game_id"
    t.integer "session_id"
    t.float   "raw_score"
    t.float   "score"
    t.float   "percentile"
    t.integer "match_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "url_videos", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.string  "title"
    t.text    "description"
    t.string  "video_source"
    t.string  "video_id"
    t.string  "url"
    t.string  "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name"
    t.text     "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "websites", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.string  "title"
    t.text    "description"
    t.string  "image_url"
    t.string  "url"
    t.string  "slug"
  end

end
