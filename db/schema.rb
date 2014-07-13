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

ActiveRecord::Schema.define(version: 20140713061355) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "jobs_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "category_id",       default: 1
    t.string   "location"
    t.text     "apply_instruction"
    t.date     "created_on"
    t.date     "update_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "url"
    t.string   "email"
    t.integer  "lower_bound"
    t.integer  "higher_bound"
    t.string   "token"
    t.boolean  "is_published"
  end

  add_index "jobs", ["is_published"], name: "index_jobs_on_is_published"
  add_index "jobs", ["token"], name: "index_jobs_on_token"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
