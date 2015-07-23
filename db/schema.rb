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

ActiveRecord::Schema.define(version: 20150628075523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.string   "note"
    t.string   "title"
    t.string   "recommendation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "spreedsheat_id"
    t.string   "have_photo"
    t.string   "manufacturer"
    t.string   "product_name"
    t.string   "product_name_2"
    t.string   "flavor"
    t.string   "category"
    t.string   "quantity"
    t.string   "thc_dose"
    t.string   "nb_dose"
    t.string   "thc"
    t.string   "dry_weed"
    t.string   "cbd_dose"
    t.string   "thc_3_party"
    t.string   "type_strain"
    t.text     "dispenary_name"
    t.string   "unit_of_mesure"
    t.string   "thc_uom"
    t.string   "ingredients"
    t.string   "dairy"
    t.text     "nuts"
    t.string   "nutritions_extra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "file_name"
    t.boolean  "verified",         default: false
    t.text     "file_name_2"
    t.text     "creator"
    t.integer  "creatorId"
    t.text     "extract_type"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "sport"
    t.string   "eaten"
    t.string   "alcohol"
    t.string   "checkin_start"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "recomendation"
    t.text     "high_level"
    t.integer  "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "star"
    t.string   "comment"
    t.string   "dosage_feedback"
    t.integer  "product_id"
    t.integer  "recommendation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "username"
    t.text     "confirm_success_url"
    t.text     "full_name"
    t.text     "birthdate"
    t.text     "weight"
    t.text     "gender"
    t.text     "height"
    t.text     "experience_level"
    t.integer  "wish_list",                                        array: true
    t.json     "up_voted"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
