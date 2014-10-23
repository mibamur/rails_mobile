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

ActiveRecord::Schema.define(version: 20141023044743) do

  create_table "cat_dohods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cat_rashods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dohods", force: true do |t|
    t.integer  "schet_id"
    t.integer  "cat_dohod_id"
    t.text     "comment"
    t.integer  "rab_id"
    t.date     "todate"
    t.decimal  "cash",         precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dohods", ["cat_dohod_id"], name: "index_dohods_on_cat_dohod_id"
  add_index "dohods", ["rab_id"], name: "index_dohods_on_rab_id"
  add_index "dohods", ["schet_id"], name: "index_dohods_on_schet_id"

  create_table "logins", force: true do |t|
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
  end

  add_index "logins", ["email"], name: "index_logins_on_email", unique: true
  add_index "logins", ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true

  create_table "logins_roles", id: false, force: true do |t|
    t.integer "login_id"
    t.integer "role_id"
  end

  add_index "logins_roles", ["login_id", "role_id"], name: "index_logins_roles_on_login_id_and_role_id"

  create_table "perevods", force: true do |t|
    t.integer  "schet_from"
    t.integer  "schet_to"
    t.integer  "rab_id"
    t.date     "todate"
    t.decimal  "cash",       precision: 18, scale: 2
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perevods", ["rab_id"], name: "index_perevods_on_rab_id"

  create_table "rab_images", force: true do |t|
    t.string   "image"
    t.integer  "rab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rab_images", ["rab_id"], name: "index_rab_images_on_rab_id"

  create_table "rabs", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "tel"
    t.integer  "login_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rabs", ["login_id"], name: "index_rabs_on_login_id"

  create_table "rashods", force: true do |t|
    t.integer  "schet_id"
    t.integer  "cat_rashod_id"
    t.text     "comment"
    t.integer  "rab_id"
    t.date     "todate"
    t.decimal  "cash",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rashods", ["cat_rashod_id"], name: "index_rashods_on_cat_rashod_id"
  add_index "rashods", ["rab_id"], name: "index_rashods_on_rab_id"
  add_index "rashods", ["schet_id"], name: "index_rashods_on_schet_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "schets", force: true do |t|
    t.string   "name"
    t.integer  "login_id"
    t.boolean  "panel"
    t.boolean  "balance"
    t.decimal  "cash",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schets", ["login_id"], name: "index_schets_on_login_id"

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
