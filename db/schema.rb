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

ActiveRecord::Schema.define(version: 20140825232343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "build_requests", force: true do |t|
    t.integer  "user_id"
    t.boolean  "emergency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "given_control_at"
  end

  add_index "build_requests", ["user_id"], name: "index_build_requests_on_user_id", using: :btree

  create_table "builds", force: true do |t|
    t.datetime "finished_at"
    t.integer  "user_id"
    t.integer  "environment_id"
    t.string   "sha"
    t.boolean  "successful"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "builds", ["environment_id"], name: "index_builds_on_environment_id", using: :btree
  add_index "builds", ["user_id"], name: "index_builds_on_user_id", using: :btree

  create_table "control_sessions", force: true do |t|
    t.datetime "finished_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "control_sessions", ["user_id"], name: "index_control_sessions_on_user_id", using: :btree

  create_table "environments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "avatar"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
