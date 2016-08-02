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

ActiveRecord::Schema.define(version: 20160721024331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "full_name",                null: false
    t.string   "cpf",                      null: false
    t.date     "birth_date"
    t.string   "rg"
    t.string   "rg_sender"
    t.date     "rg_expedition"
    t.string   "place_birth"
    t.string   "place_birth_uf", limit: 2
    t.string   "nacionality"
    t.string   "mother"
    t.string   "father"
    t.string   "postal_code",    limit: 9
    t.string   "address"
    t.string   "neighborhood"
    t.string   "adjunct"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "vehicle_id",                                      null: false
    t.integer  "seller_id",                                       null: false
    t.decimal  "sale_price",              precision: 8, scale: 2, null: false
    t.date     "sale_date",                                       null: false
    t.string   "incoming_invoice_number"
    t.date     "incoming_invoice_date"
    t.integer  "purchaser_id"
    t.decimal  "purchase_price",          precision: 8, scale: 2
    t.date     "purchase_date"
    t.string   "output_invoice_number"
    t.date     "output_invoice_date"
    t.boolean  "brokerage"
    t.text     "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["purchaser_id"], name: "index_sales_on_purchaser_id", using: :btree
  add_index "sales", ["seller_id"], name: "index_sales_on_seller_id", using: :btree
  add_index "sales", ["vehicle_id"], name: "index_sales_on_vehicle_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "brand",                       null: false
    t.string   "version",                     null: false
    t.integer  "maker_year",                  null: false
    t.integer  "model_year",                  null: false
    t.string   "license_plate",     limit: 8, null: false
    t.string   "city"
    t.string   "uf",                limit: 2
    t.string   "color"
    t.string   "fuel"
    t.string   "renavam"
    t.string   "chassi"
    t.string   "owner"
    t.string   "old_license_plate", limit: 8
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "sales", "customers", column: "purchaser_id"
  add_foreign_key "sales", "customers", column: "seller_id"
  add_foreign_key "sales", "vehicles"
end
