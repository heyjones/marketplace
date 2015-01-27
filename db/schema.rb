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

ActiveRecord::Schema.define(version: 20150127001734) do

  create_table "line_items", id: false, force: true do |t|
    t.integer "order_id"
    t.integer "id"
    t.string  "name"
    t.string  "sku"
    t.integer "quantity"
    t.decimal "price"
    t.integer "grams"
    t.string  "fulfillment_status"
    t.integer "vendor_id"
    t.integer "product_id"
  end

  create_table "orders", id: false, force: true do |t|
    t.integer  "shop_id"
    t.integer  "id"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "province_code"
    t.string   "zip"
    t.string   "country_code"
    t.datetime "created_at"
  end

  create_table "shops", force: true do |t|
    t.string   "domain"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

end
