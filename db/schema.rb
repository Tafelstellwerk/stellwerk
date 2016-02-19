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

ActiveRecord::Schema.define(version: 20160219115202) do

  create_table "donation_cases", force: true do |t|
    t.string   "title"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "address"
    t.string   "plz_and_city"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "email"
    t.string   "token"
    t.boolean  "need_review"
  end

  add_index "donation_cases", ["user_id"], name: "index_donation_cases_on_user_id"

  create_table "donations", force: true do |t|
    t.string   "title"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "donation_case_id"
    t.text     "properties"
    t.string   "best_before_date"
    t.string   "availible_from"
    t.boolean  "froozen"
    t.boolean  "supporting_document"
    t.string   "fetch_time"
  end

  add_index "donations", ["donation_case_id"], name: "index_donations_on_donation_case_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "version_associations", force: true do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id"

  create_table "versions", force: true do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.integer  "transaction_id"
    t.text     "object_changes", limit: 1073741823
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id"

end
