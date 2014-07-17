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

ActiveRecord::Schema.define(version: 20140717131128) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "jobs_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.text     "apply_instruction"
    t.date     "created_on"
    t.date     "updated_on"
    t.string   "company_name"
    t.string   "url"
    t.string   "email"
    t.integer  "lower_bound"
    t.integer  "higher_bound"
    t.string   "token"
    t.boolean  "is_published",       default: false
    t.string   "ip"
    t.boolean  "email_confirmed"
    t.datetime "email_confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_subscriptions", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_subscriptions", ["token"], name: "index_email_subscriptions_on_token"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "category_id",                   default: 1
    t.string   "location"
    t.text     "apply_instruction"
    t.date     "created_on"
    t.date     "updated_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "url"
    t.string   "email"
    t.integer  "lower_bound"
    t.integer  "higher_bound"
    t.string   "token"
    t.boolean  "is_published"
    t.string   "ip",                 limit: 30
    t.boolean  "email_confirmed",               default: false
    t.datetime "email_confirmed_at"
  end

  add_index "jobs", ["created_on"], name: "index_jobs_on_created_on"
  add_index "jobs", ["ip", "created_on"], name: "index_jobs_on_ip_and_created_on"
  add_index "jobs", ["ip"], name: "index_jobs_on_ip"
  add_index "jobs", ["is_published"], name: "index_jobs_on_is_published"
  add_index "jobs", ["token"], name: "index_jobs_on_token"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
