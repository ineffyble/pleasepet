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

ActiveRecord::Schema.define(version: 20170221120141) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "noises", force: :cascade do |t|
    t.integer  "page_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "sound_file_name"
    t.string   "sound_content_type"
    t.integer  "sound_file_size"
    t.datetime "sound_updated_at"
    t.index ["page_id"], name: "index_noises_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "pet_id"
    t.string   "url"
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.index ["pet_id"], name: "index_pages_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "page_id"
    t.string   "name"
    t.integer  "received_pettings_count"
    t.integer  "performed_pettings_count"
    t.index ["email"], name: "index_pets_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pets_on_reset_password_token", unique: true
  end

  create_table "pettings", force: :cascade do |t|
    t.integer  "petter_id"
    t.integer  "petted_id"
    t.datetime "petted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petted_id"], name: "index_pettings_on_petted_id"
    t.index ["petter_id"], name: "index_pettings_on_petter_id"
  end

end
