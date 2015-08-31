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

ActiveRecord::Schema.define(version: 20150726021957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "postgis"
  enable_extension "postgis_topology"
  enable_extension "fuzzystrmatch"
  enable_extension "postgis_tiger_geocoder"

  create_table "addr", primary_key: "gid", force: :cascade do |t|
    t.integer "tlid",      limit: 8
    t.string  "fromhn",    limit: 12
    t.string  "tohn",      limit: 12
    t.string  "side",      limit: 1
    t.string  "zip",       limit: 5
    t.string  "plus4",     limit: 4
    t.string  "fromtyp",   limit: 1
    t.string  "totyp",     limit: 1
    t.integer "fromarmid"
    t.integer "toarmid"
    t.string  "arid",      limit: 22
    t.string  "mtfcc",     limit: 5
    t.string  "statefp",   limit: 2
  end

  add_index "addr", ["tlid", "statefp"], name: "idx_tiger_addr_tlid_statefp", using: :btree
  add_index "addr", ["zip"], name: "idx_tiger_addr_zip", using: :btree

# Could not dump table "addrfeat" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "all_edibles", force: :cascade do |t|
    t.text    "url"
    t.text    "dispensary_name"
    t.text    "brand"
    t.text    "flavor"
    t.text    "item"
    t.text    "mg"
    t.text    "$$"
    t.text    "raw"
    t.text    "comments"
    t.integer "dispensary_id"
    t.integer "product_id"
  end

# Could not dump table "bg" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "brands", force: :cascade do |t|
    t.text "name"
    t.text "address"
  end

# Could not dump table "county" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "county_lookup", primary_key: "st_code", force: :cascade do |t|
    t.string  "state",   limit: 2
    t.integer "co_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "county_lookup", ["state"], name: "county_lookup_state_idx", using: :btree

  create_table "countysub_lookup", primary_key: "st_code", force: :cascade do |t|
    t.string  "state",   limit: 2
    t.integer "co_code",            null: false
    t.string  "county",  limit: 90
    t.integer "cs_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "countysub_lookup", ["state"], name: "countysub_lookup_state_idx", using: :btree

# Could not dump table "cousub" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "deals", force: :cascade do |t|
    t.text    "title"
    t.text    "desc"
    t.date    "exipre_at"
    t.integer "product_id"
    t.integer "dispensary_id"
    t.integer "brand_id"
    t.text    "photo"
    t.text    "status"
    t.boolean "is_loyalty",    default: false
  end

  create_table "direction_lookup", primary_key: "name", force: :cascade do |t|
    t.string "abbrev", limit: 3
  end

  add_index "direction_lookup", ["abbrev"], name: "direction_lookup_abbrev_idx", using: :btree

  create_table "dispensaries", force: :cascade do |t|
    t.text    "url"
    t.text    "name"
    t.text    "state"
    t.text    "region"
    t.text    "address"
    t.text    "phone"
    t.text    "email"
    t.text    "stars"
    t.text    "nb_reviews"
    t.text    "facebook"
    t.text    "twitter"
    t.text    "instagram"
    t.boolean "contacted",  default: false
  end

# Could not dump table "edges" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "faces" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "featnames", primary_key: "gid", force: :cascade do |t|
    t.integer "tlid",       limit: 8
    t.string  "fullname",   limit: 100
    t.string  "name",       limit: 100
    t.string  "predirabrv", limit: 15
    t.string  "pretypabrv", limit: 50
    t.string  "prequalabr", limit: 15
    t.string  "sufdirabrv", limit: 15
    t.string  "suftypabrv", limit: 50
    t.string  "sufqualabr", limit: 15
    t.string  "predir",     limit: 2
    t.string  "pretyp",     limit: 3
    t.string  "prequal",    limit: 2
    t.string  "sufdir",     limit: 2
    t.string  "suftyp",     limit: 3
    t.string  "sufqual",    limit: 2
    t.string  "linearid",   limit: 22
    t.string  "mtfcc",      limit: 5
    t.string  "paflag",     limit: 1
    t.string  "statefp",    limit: 2
  end

  add_index "featnames", ["tlid", "statefp"], name: "idx_tiger_featnames_tlid_statefp", using: :btree

  create_table "geocode_settings", primary_key: "name", force: :cascade do |t|
    t.text "setting"
    t.text "unit"
    t.text "category"
    t.text "short_desc"
  end

  create_table "loader_lookuptables", primary_key: "lookup_name", force: :cascade do |t|
    t.integer "process_order",                   default: 1000,  null: false
    t.text    "table_name"
    t.boolean "single_mode",                     default: true,  null: false
    t.boolean "load",                            default: true,  null: false
    t.boolean "level_county",                    default: false, null: false
    t.boolean "level_state",                     default: false, null: false
    t.boolean "level_nation",                    default: false, null: false
    t.text    "post_load_process"
    t.boolean "single_geom_mode",                default: false
    t.string  "insert_mode",           limit: 1, default: "c",   null: false
    t.text    "pre_load_process"
    t.text    "columns_exclude",                                              array: true
    t.text    "website_root_override"
  end

  create_table "loader_platform", primary_key: "os", force: :cascade do |t|
    t.text "declare_sect"
    t.text "pgbin"
    t.text "wget"
    t.text "unzip_command"
    t.text "psql"
    t.text "path_sep"
    t.text "loader"
    t.text "environ_set_command"
    t.text "county_process_command"
  end

  create_table "loader_variables", primary_key: "tiger_year", force: :cascade do |t|
    t.text "website_root"
    t.text "staging_fold"
    t.text "data_schema"
    t.text "staging_schema"
  end

  create_table "pagc_gaz", force: :cascade do |t|
    t.integer "seq"
    t.text    "word"
    t.text    "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_lex", force: :cascade do |t|
    t.integer "seq"
    t.text    "word"
    t.text    "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_rules", force: :cascade do |t|
    t.text    "rule"
    t.boolean "is_custom", default: true
  end

# Could not dump table "place" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "place_lookup", primary_key: "st_code", force: :cascade do |t|
    t.string  "state",   limit: 2
    t.integer "pl_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "place_lookup", ["state"], name: "place_lookup_state_idx", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "spreadsheet_id"
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
    t.string   "nutritional_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "file_name"
    t.boolean  "verified",          default: false
    t.text     "file_name_2"
    t.text     "creator"
    t.integer  "creatorId"
    t.text     "extract_type"
    t.text     "flavor_backend"
    t.text     "cbd_total"
    t.text     "cbd_uom"
    t.text     "nut_info"
    t.text     "add_file_name"
  end

  create_table "products3", force: :cascade do |t|
    t.text     "spreedsheat_id"
    t.string   "have_photo"
    t.string   "manufacturer"
    t.string   "product_name"
    t.string   "product_name_2"
    t.string   "flavor"
    t.string   "flavor_backend"
    t.string   "category"
    t.string   "quantity"
    t.string   "thc_dose"
    t.string   "cbd_dose"
    t.string   "nb_dose"
    t.string   "thc"
    t.string   "dry_weed"
    t.string   "cbd_total"
    t.string   "thc_3_party"
    t.string   "type_strain"
    t.text     "dispenary_name"
    t.string   "unit_of_mesure"
    t.string   "thc_uom"
    t.string   "cbd_uom"
    t.string   "nutritional_notes"
    t.string   "ingredients"
    t.string   "dairy"
    t.text     "nuts"
    t.text     "nut_info"
    t.text     "extract_type"
    t.text     "file_name"
    t.text     "add_file_name"
    t.text     "file_name_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified",          default: false
    t.text     "creator"
    t.integer  "creatorId"
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

  create_table "secondary_unit_lookup", primary_key: "name", force: :cascade do |t|
    t.string "abbrev", limit: 5
  end

  add_index "secondary_unit_lookup", ["abbrev"], name: "secondary_unit_lookup_abbrev_idx", using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

# Could not dump table "state" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "state_lookup", primary_key: "st_code", force: :cascade do |t|
    t.string "name",    limit: 40
    t.string "abbrev",  limit: 3
    t.string "statefp", limit: 2
  end

  add_index "state_lookup", ["abbrev"], name: "state_lookup_abbrev_key", unique: true, using: :btree
  add_index "state_lookup", ["name"], name: "state_lookup_name_key", unique: true, using: :btree
  add_index "state_lookup", ["statefp"], name: "state_lookup_statefp_key", unique: true, using: :btree

  create_table "street_type_lookup", primary_key: "name", force: :cascade do |t|
    t.string  "abbrev", limit: 50
    t.boolean "is_hw",             default: false, null: false
  end

  add_index "street_type_lookup", ["abbrev"], name: "street_type_lookup_abbrev_idx", using: :btree

# Could not dump table "tabblock" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "tract" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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
    t.text     "photo_url"
    t.text     "brands",                                           array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

# Could not dump table "zcta5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "zip_lookup", primary_key: "zip", force: :cascade do |t|
    t.integer "st_code"
    t.string  "state",   limit: 2
    t.integer "co_code"
    t.string  "county",  limit: 90
    t.integer "cs_code"
    t.string  "cousub",  limit: 90
    t.integer "pl_code"
    t.string  "place",   limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_all", id: false, force: :cascade do |t|
    t.integer "zip"
    t.integer "st_code"
    t.string  "state",   limit: 2
    t.integer "co_code"
    t.string  "county",  limit: 90
    t.integer "cs_code"
    t.string  "cousub",  limit: 90
    t.integer "pl_code"
    t.string  "place",   limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_base", primary_key: "zip", force: :cascade do |t|
    t.string "state",   limit: 40
    t.string "county",  limit: 90
    t.string "city",    limit: 90
    t.string "statefp", limit: 2
  end

  create_table "zip_state", primary_key: "zip", force: :cascade do |t|
    t.string "stusps",  limit: 2, null: false
    t.string "statefp", limit: 2
  end

  create_table "zip_state_loc", primary_key: "zip", force: :cascade do |t|
    t.string "stusps",  limit: 2,   null: false
    t.string "statefp", limit: 2
    t.string "place",   limit: 100, null: false
  end

end
