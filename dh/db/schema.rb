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

ActiveRecord::Schema.define(version: 20151111163549) do

  create_table "assignments", force: :cascade do |t|
    t.datetime "due_date"
    t.text     "description", limit: 65535
    t.string   "title",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "extensions", force: :cascade do |t|
    t.integer  "assignment_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "new_due_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "path_comments", force: :cascade do |t|
    t.string   "text",              limit: 255
    t.integer  "user_id",           limit: 4
    t.integer  "assignment_author", limit: 4
    t.integer  "assignment_id",     limit: 4
    t.boolean  "present"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.integer  "assignment_author", limit: 4
    t.integer  "assignment_id",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "step_comments", force: :cascade do |t|
    t.integer  "step_id",    limit: 4
    t.string   "text",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "assignment_id", limit: 4
    t.string   "title",         limit: 255,   null: false
    t.text     "url",           limit: 65535
    t.string   "justification", limit: 255
    t.integer  "parent_id",     limit: 4
    t.integer  "lft",           limit: 4,     null: false
    t.integer  "rgt",           limit: 4,     null: false
    t.boolean  "favorite"
    t.boolean  "document"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "screenshot",    limit: 255
  end

  add_index "steps", ["lft"], name: "index_steps_on_lft", using: :btree
  add_index "steps", ["parent_id"], name: "index_steps_on_parent_id", using: :btree
  add_index "steps", ["rgt"], name: "index_steps_on_rgt", using: :btree

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
