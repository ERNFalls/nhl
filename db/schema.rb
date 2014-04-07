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

ActiveRecord::Schema.define(version: 20140407075850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.string   "country"
    t.string   "address_type"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type", using: :btree

  create_table "bank_accounts", force: true do |t|
    t.string   "bank"
    t.string   "account_type"
    t.decimal  "average_monthly_balance", precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bankruptcy_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bankruptcy_matters_clients", id: false, force: true do |t|
    t.integer "chapter"
    t.string  "bankruptcy_type"
    t.integer "client_id"
    t.integer "bankruptcy_matter_id"
  end

  add_index "bankruptcy_matters_clients", ["bankruptcy_matter_id"], name: "index_bankruptcy_matters_clients_on_bankruptcy_matter_id", using: :btree
  add_index "bankruptcy_matters_clients", ["client_id"], name: "index_bankruptcy_matters_clients_on_client_id", using: :btree

  create_table "boats", force: true do |t|
    t.boolean  "keep",                                  default: false
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "engine"
    t.string   "bank"
    t.string   "account_no"
    t.decimal  "balance_owed", precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "company_name"
    t.string   "business_description"
    t.date     "business_start_date"
    t.boolean  "active"
    t.string   "assets"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "civil_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "civil_matters_clients", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "civil_matter_id"
  end

  add_index "civil_matters_clients", ["civil_matter_id"], name: "index_civil_matters_clients_on_civil_matter_id", using: :btree
  add_index "civil_matters_clients", ["client_id"], name: "index_civil_matters_clients_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "company_name"
    t.string   "ssn"
    t.string   "drivers_license_no"
    t.string   "date_of_birth"
    t.string   "aliases"
    t.string   "spouse"
    t.string   "marital_status"
    t.string   "repossessions"
    t.string   "pending_suit"
    t.decimal  "amount_owed_to_irs",      precision: 10, scale: 2
    t.string   "safety_deposit_contents"
    t.string   "safety_deposit_location"
    t.string   "safety_deposit_list"
    t.string   "other_losses"
    t.boolean  "ira",                                              default: false
    t.boolean  "four_o_one_k",                                     default: false
    t.decimal  "retirement",              precision: 10, scale: 2
    t.decimal  "pension",                 precision: 10, scale: 2
    t.decimal  "disability",              precision: 10, scale: 2
    t.decimal  "child_support",           precision: 10, scale: 2
    t.decimal  "alimony",                 precision: 10, scale: 2
    t.decimal  "other_income",            precision: 10, scale: 2
    t.string   "referred_by"
    t.string   "email",                                            default: "",    null: false
    t.string   "encrypted_password",                               default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_commercial_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "commercial_matter_id"
  end

  add_index "clients_commercial_matters", ["client_id"], name: "index_clients_commercial_matters_on_client_id", using: :btree
  add_index "clients_commercial_matters", ["commercial_matter_id"], name: "index_clients_commercial_matters_on_commercial_matter_id", using: :btree

  create_table "clients_criminal_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "criminal_matter_id"
  end

  add_index "clients_criminal_matters", ["client_id"], name: "index_clients_criminal_matters_on_client_id", using: :btree
  add_index "clients_criminal_matters", ["criminal_matter_id"], name: "index_clients_criminal_matters_on_criminal_matter_id", using: :btree

  create_table "clients_family_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "family_matter_id"
  end

  add_index "clients_family_matters", ["client_id"], name: "index_clients_family_matters_on_client_id", using: :btree
  add_index "clients_family_matters", ["family_matter_id"], name: "index_clients_family_matters_on_family_matter_id", using: :btree

  create_table "clients_foreclosure_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "foreclosure_matter_id"
  end

  add_index "clients_foreclosure_matters", ["client_id"], name: "index_clients_foreclosure_matters_on_client_id", using: :btree
  add_index "clients_foreclosure_matters", ["foreclosure_matter_id"], name: "index_clients_foreclosure_matters_on_foreclosure_matter_id", using: :btree

  create_table "clients_immigration_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "immigration_matter_id"
  end

  add_index "clients_immigration_matters", ["client_id"], name: "index_clients_immigration_matters_on_client_id", using: :btree
  add_index "clients_immigration_matters", ["immigration_matter_id"], name: "index_clients_immigration_matters_on_immigration_matter_id", using: :btree

  create_table "clients_modification_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "modification_matter_id"
  end

  add_index "clients_modification_matters", ["client_id"], name: "index_clients_modification_matters_on_client_id", using: :btree
  add_index "clients_modification_matters", ["modification_matter_id"], name: "index_clients_modification_matters_on_modification_matter_id", using: :btree

  create_table "clients_pi_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "pi_matter_id"
  end

  add_index "clients_pi_matters", ["client_id"], name: "index_clients_pi_matters_on_client_id", using: :btree
  add_index "clients_pi_matters", ["pi_matter_id"], name: "index_clients_pi_matters_on_pi_matter_id", using: :btree

  create_table "clients_pip_matters", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "pip_matter_id"
  end

  add_index "clients_pip_matters", ["client_id"], name: "index_clients_pip_matters_on_client_id", using: :btree
  add_index "clients_pip_matters", ["pip_matter_id"], name: "index_clients_pip_matters_on_pip_matter_id", using: :btree

  create_table "commercial_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "company_name"
    t.string   "contact_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creditors", force: true do |t|
    t.string   "creditor"
    t.string   "account_no"
    t.date     "date_last_used"
    t.decimal  "balance",            precision: 10, scale: 2
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criminal_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependants", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "ssn"
    t.date     "date_of_birth"
    t.string   "relationship"
    t.string   "employment"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_addresses", force: true do |t|
    t.string   "address"
    t.string   "address_type"
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_addresses", ["emailable_id", "emailable_type"], name: "index_email_addresses_on_emailable_id_and_emailable_type", using: :btree

  create_table "emails", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "expense_type"
    t.decimal  "expense",      precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foreclosure_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "furnitures", force: true do |t|
    t.string   "item_model"
    t.string   "description"
    t.decimal  "price_at_purchase", precision: 10, scale: 2
    t.date     "date_of_purchase"
    t.string   "number_owned"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "immigration_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_carriers", force: true do |t|
    t.string   "company_name"
    t.string   "corporate_rep_last_name"
    t.string   "corporate_rep_first_name"
    t.string   "corporate_rep_middle_name"
    t.string   "corporate_rep_prefix"
    t.string   "corporate_rep_suffix"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "plus_four_code"
    t.string   "country"
    t.string   "area_code"
    t.string   "exchange"
    t.string   "suffix"
    t.string   "extension"
    t.string   "country_code"
    t.string   "fax_area_code"
    t.string   "fax_exchange"
    t.string   "fax_suffix"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_companies", force: true do |t|
    t.string   "company_name"
    t.string   "corporate_rep_last_name"
    t.string   "corporate_rep_first_name"
    t.string   "corporate_rep_middle_name"
    t.string   "corporate_rep_prefix"
    t.string   "corporate_rep_suffix"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "plus_four_code"
    t.string   "country"
    t.string   "area_code"
    t.string   "exchange"
    t.string   "suffix"
    t.string   "extension"
    t.string   "country_code"
    t.string   "fax_area_code"
    t.string   "fax_exchange"
    t.string   "fax_suffix"
    t.string   "email_address"
    t.integer  "insurance_carrier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "employer"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.string   "position"
    t.string   "employment_length"
    t.string   "payment_cycle"
    t.decimal  "gross_earnings",     precision: 10, scale: 2
    t.decimal  "net_earnings",       precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_providers", force: true do |t|
    t.string   "company_name"
    t.string   "corporate_rep_last_name"
    t.string   "corporate_rep_first_name"
    t.string   "corporate_rep_middle_name"
    t.string   "corporate_rep_prefix"
    t.string   "corporate_rep_suffix"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "plus_four_code"
    t.string   "country"
    t.string   "area_code"
    t.string   "exchange"
    t.string   "suffix"
    t.string   "extension"
    t.string   "country_code"
    t.string   "fax_area_code"
    t.string   "fax_exchange"
    t.string   "fax_suffix"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "message"
    t.integer  "messageable_id"
    t.string   "messageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["messageable_id", "messageable_type"], name: "index_messages_on_messageable_id_and_messageable_type", using: :btree

  create_table "modification_matters", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mortgages", force: true do |t|
    t.string   "mortgage_holder"
    t.string   "account_no"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.decimal  "balance",            precision: 10, scale: 2
    t.string   "overdue_payment"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.string   "note"
    t.integer  "user_id"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["noteable_id", "noteable_type"], name: "index_notes_on_noteable_id_and_noteable_type", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "other_cases", force: true do |t|
    t.string   "plaintiff"
    t.string   "defendant"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "clients_counsel"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", force: true do |t|
    t.integer  "country_code"
    t.integer  "area_code"
    t.integer  "exchange"
    t.integer  "suffix"
    t.integer  "extension"
    t.string   "phone_number_type"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_numbers", ["phoneable_id", "phoneable_type"], name: "index_phone_numbers_on_phoneable_id_and_phoneable_type", using: :btree

  create_table "pi_matters", force: true do |t|
    t.date     "date_of_loss"
    t.string   "accident_type"
    t.string   "accident_address_line_one"
    t.string   "accident_address_line_two"
    t.string   "accident_address_line_three"
    t.string   "accident_city"
    t.string   "accident_state"
    t.string   "accident_country"
    t.string   "accident_zip_code"
    t.string   "accident_plus_four_code"
    t.string   "accident_reporting_agency"
    t.string   "insurance_carrier"
    t.string   "insurance_company"
    t.string   "claim_no"
    t.string   "policy_no"
    t.string   "insured_name"
    t.string   "claims_adjuster"
    t.date     "first_date_of_policy"
    t.date     "final_date_of_policy"
    t.boolean  "personal_injury_protection"
    t.decimal  "personal_injury_protection_pp_limit", precision: 10, scale: 2
    t.boolean  "bodily_injury_coverage"
    t.decimal  "bodily_injury_pp_limit",              precision: 10, scale: 2
    t.boolean  "property_damage_coverage"
    t.decimal  "property_damage_limit",               precision: 10, scale: 2
    t.boolean  "um_coverage"
    t.decimal  "um_pp_limit",                         precision: 10, scale: 2
    t.decimal  "deductible",                          precision: 10, scale: 2
    t.string   "vehicle_make"
    t.string   "vehicle_model"
    t.string   "vehicle_year"
    t.string   "primary_medical_provider"
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pip_checks", force: true do |t|
    t.string   "check_no"
    t.date     "date_of_issue"
    t.decimal  "total_amount",          precision: 10, scale: 2
    t.decimal  "benefits",              precision: 10, scale: 2
    t.decimal  "interest",              precision: 10, scale: 2
    t.decimal  "penalty",               precision: 10, scale: 2
    t.decimal  "postage",               precision: 10, scale: 2
    t.decimal  "attorneys_fees",        precision: 10, scale: 2
    t.string   "purpose_of_check"
    t.boolean  "include_check_in_suit"
    t.string   "status"
    t.integer  "pip_matter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pip_demands", force: true do |t|
    t.date     "first_date_of_service"
    t.date     "final_date_of_service"
    t.boolean  "demand_sent",                                     default: false
    t.date     "date_demand_sent"
    t.boolean  "carrier_received",                                default: false
    t.date     "date_carrier_received"
    t.boolean  "carrier_responded",                               default: false
    t.date     "date_of_response"
    t.string   "certified_mail_no"
    t.decimal  "postage_cost",           precision: 10, scale: 2
    t.decimal  "total_billed",           precision: 10, scale: 2
    t.decimal  "amount_paid_predemand",  precision: 10, scale: 2
    t.decimal  "deductible",             precision: 10, scale: 2
    t.string   "carrier_response"
    t.boolean  "include_demand_in_suit",                          default: true
    t.integer  "pip_matter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pip_matters", force: true do |t|
    t.date     "date_of_loss"
    t.string   "medical_provider"
    t.string   "claimant_last_name"
    t.string   "claimant_first_name"
    t.string   "claimant_middle_name"
    t.string   "claimant_prefix"
    t.string   "claimant_suffix"
    t.string   "insurance_carrier"
    t.string   "insurance_company"
    t.string   "claim_no"
    t.string   "policy_no"
    t.string   "insured_name"
    t.string   "claims_adjuster"
    t.date     "first_date_of_policy"
    t.date     "final_date_of_policy"
    t.string   "plaintiff"
    t.string   "defendant"
    t.boolean  "side"
    t.string   "case_state"
    t.string   "case_county"
    t.integer  "case_year"
    t.integer  "case_sequence"
    t.string   "case_code"
    t.integer  "case_location"
    t.integer  "judicial_section"
    t.string   "judge"
    t.string   "opposing_counsel"
    t.date     "date_suit_filed"
    t.date     "date_of_sop"
    t.datetime "initial_court_date"
    t.string   "status"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.boolean  "rent",                                                    default: false
    t.string   "property_type"
    t.date     "date_of_purchase"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.string   "association_name"
    t.string   "association_address_line_one"
    t.string   "association_address_line_two"
    t.string   "association_address_line_three"
    t.string   "association_city"
    t.string   "association_state"
    t.integer  "association_zip_code"
    t.integer  "association_plus_four_code"
    t.decimal  "association_balance",            precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_transfers", force: true do |t|
    t.string   "property_type"
    t.string   "property_address_line_one"
    t.string   "property_address_line_two"
    t.string   "property_address_line_three"
    t.string   "property_city"
    t.string   "property_state"
    t.integer  "property_zip_code"
    t.integer  "property_plus_four_code"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "plus_four_code"
    t.decimal  "amount_received",             precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "task"
    t.string   "priority"
    t.string   "status"
    t.datetime "due_date"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.integer  "created_by"
    t.integer  "assigned_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["taskable_id", "taskable_type"], name: "index_tasks_on_taskable_id_and_taskable_type", using: :btree

  create_table "templates", force: true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "template_type"
    t.boolean  "private"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "company_name"
    t.string   "role"
    t.string   "avatar"
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.boolean  "keep",                                     default: false
    t.string   "ownership_type"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "current_mileage"
    t.string   "bank"
    t.string   "account_no"
    t.decimal  "balance_owed",    precision: 10, scale: 2
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "bank_accounts", "clients", name: "bank_accounts_client_id_fk"

  add_foreign_key "boats", "clients", name: "boats_client_id_fk"

  add_foreign_key "businesses", "clients", name: "businesses_client_id_fk"

  add_foreign_key "creditors", "clients", name: "creditors_client_id_fk"

  add_foreign_key "dependants", "clients", name: "dependants_client_id_fk"

  add_foreign_key "expenses", "clients", name: "expenses_client_id_fk"

  add_foreign_key "furnitures", "clients", name: "furnitures_client_id_fk"

  add_foreign_key "insurance_companies", "insurance_carriers", name: "insurance_companies_insurance_carrier_id_fk"

  add_foreign_key "jobs", "clients", name: "jobs_client_id_fk"

  add_foreign_key "mortgages", "properties", name: "mortgages_property_id_fk"

  add_foreign_key "other_cases", "clients", name: "other_cases_client_id_fk"

  add_foreign_key "pip_checks", "pip_matters", name: "pip_checks_pip_matter_id_fk"

  add_foreign_key "pip_demands", "pip_matters", name: "pip_demands_pip_matter_id_fk"

  add_foreign_key "properties", "clients", name: "properties_client_id_fk"

  add_foreign_key "property_transfers", "clients", name: "property_transfers_client_id_fk"

  add_foreign_key "templates", "users", name: "templates_user_id_fk"

  add_foreign_key "vehicles", "clients", name: "vehicles_client_id_fk"

end
