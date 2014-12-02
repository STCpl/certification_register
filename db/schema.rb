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

ActiveRecord::Schema.define(version: 20141202050528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "person_id"
    t.integer  "classification_id"
    t.string   "number"
    t.date     "attain_date"
    t.date     "expiry_date"
    t.integer  "expiry_prior_notification_days"
    t.text     "notes"
    t.integer  "extdb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachments",                    default: [], array: true
    t.string   "attachment_1"
    t.string   "attachment_2"
    t.string   "attachment_3"
    t.string   "attachment_4"
    t.boolean  "active"
    t.integer  "state_id"
  end

  add_index "certifications", ["active"], name: "index_certifications_on_active", using: :btree
  add_index "certifications", ["attain_date"], name: "index_certifications_on_attain_date", using: :btree
  add_index "certifications", ["expiry_date"], name: "index_certifications_on_expiry_date", using: :btree
  add_index "certifications", ["name"], name: "index_certifications_on_name", using: :btree

  create_table "classifications", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "email"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "fax_number"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.integer  "postcode"
    t.integer  "extdb"
    t.string   "abn"
    t.string   "pobox_address"
    t.string   "pobox_city"
    t.string   "pobox_state"
    t.integer  "pobox_postcode"
    t.string   "website"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "documents", force: true do |t|
    t.integer  "certification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment"
  end

  create_table "incidents", force: true do |t|
    t.string   "site_location"
    t.text     "summary"
    t.boolean  "is_active"
    t.date     "date"
    t.integer  "job_id"
    t.integer  "outcome_id"
    t.integer  "state_id"
    t.integer  "person_id"
    t.integer  "company_id"
    t.integer  "injury_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_1"
    t.string   "attachment_2"
    t.string   "attachment_3"
    t.string   "attachment_4"
    t.string   "attachment_5"
    t.string   "name"
    t.string   "extdb"
    t.text     "outcome_description"
  end

  add_index "incidents", ["company_id"], name: "index_incidents_on_company_id", using: :btree
  add_index "incidents", ["injury_id"], name: "index_incidents_on_injury_id", using: :btree
  add_index "incidents", ["job_id"], name: "index_incidents_on_job_id", using: :btree
  add_index "incidents", ["outcome_id"], name: "index_incidents_on_outcome_id", using: :btree
  add_index "incidents", ["person_id"], name: "index_incidents_on_person_id", using: :btree
  add_index "incidents", ["state_id"], name: "index_incidents_on_state_id", using: :btree
  add_index "incidents", ["summary"], name: "index_incidents_on_summary", using: :btree

  create_table "injuries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "injuries", ["name"], name: "index_injuries_on_name", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.string   "code"
    t.string   "realname"
    t.string   "street"
    t.string   "city"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "fax_number"
    t.text     "notes"
    t.integer  "postcode"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.string   "extdb"
  end

  add_index "jobs", ["code"], name: "index_jobs_on_code", using: :btree
  add_index "jobs", ["name"], name: "index_jobs_on_name", using: :btree
  add_index "jobs", ["realname"], name: "index_jobs_on_realname", using: :btree

  create_table "outcomes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "outcomes", ["name"], name: "index_outcomes_on_name", using: :btree

  create_table "people", force: true do |t|
    t.string   "street"
    t.string   "email"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "fax_number"
    t.string   "job_title"
    t.string   "company_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "city"
    t.integer  "postcode"
    t.integer  "extdb"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
  end

  add_index "people", ["first_name"], name: "index_people_on_first_name", using: :btree
  add_index "people", ["last_name"], name: "index_people_on_last_name", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
