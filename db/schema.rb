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

ActiveRecord::Schema.define(version: 20150226061759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.integer  "owner_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["owner_company_id"], name: "index_applications_on_owner_company_id", using: :btree

  create_table "companies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_users", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "acl"
    t.datetime "effective"
    t.datetime "expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id", using: :btree
  add_index "company_users", ["user_id"], name: "index_company_users_on_user_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "converted_user_id"
    t.datetime "deleted_at"
    t.string   "invitable_type"
    t.integer  "invitable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "effective"
    t.datetime "expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
