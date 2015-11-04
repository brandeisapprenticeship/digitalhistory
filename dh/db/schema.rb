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

ActiveRecord::Schema.define(version: 20151104134553) do

  create_table "assignments", force: :cascade do |t|
    t.datetime "due_date"
    t.string   "description", limit: 255
    t.string   "title",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "path_comments", force: :cascade do |t|
    t.integer  "submission_id", limit: 4
    t.string   "text",          limit: 255
    t.integer  "user_id",       limit: 4
    t.boolean  "present"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "step_comments", force: :cascade do |t|
    t.integer  "step_id",    limit: 4
    t.string   "text",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "url",           limit: 255
    t.string   "justification", limit: 255
    t.integer  "parent_id",     limit: 4
    t.boolean  "favorite"
    t.boolean  "document"
    t.integer  "submission_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "student_id",    limit: 4
    t.integer  "assignment_id", limit: 4
    t.boolean  "present"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "name",                   limit: 255
    t.boolean  "admin",                              default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
