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

ActiveRecord::Schema.define(version: 20160318124041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "author_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["author_id"], name: "index_answers_on_author_id", using: :btree
  add_index "answers", ["topic_id"], name: "index_answers_on_topic_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.text     "blocks",     null: false
    t.text     "homes",      null: false
    t.text     "map"
    t.string   "level_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
  end

  create_table "solving_informations", force: :cascade do |t|
    t.integer  "solver_id",                              null: false
    t.integer  "solved_level_id",                        null: false
    t.string   "status",          default: "unfinished", null: false
    t.integer  "solving_time"
    t.integer  "difficulty"
    t.integer  "moves"
    t.integer  "tries",                                  null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "solving_informations", ["solved_level_id"], name: "index_solving_informations_on_solved_level_id", using: :btree
  add_index "solving_informations", ["solver_id"], name: "index_solving_informations_on_solver_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
    t.integer  "counter"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
