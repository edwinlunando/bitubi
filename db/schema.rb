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

ActiveRecord::Schema.define(version: 20151201153357) do

  create_table "addresses", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "state_id",             limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "receiver_name",        limit: 255
    t.string   "receiver_phone",       limit: 255
    t.string   "sender_name",          limit: 255
    t.string   "sender_phone",         limit: 255
    t.string   "zipcode",              limit: 255
    t.text     "special_instructions", limit: 65535
  end

  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.boolean  "active"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "quantity",       limit: 4
    t.integer  "order_id",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state",          limit: 255
    t.string   "receipt_number", limit: 255
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "total",                                 precision: 10
    t.text     "special_instruction",     limit: 65535
    t.string   "state",                   limit: 255
    t.integer  "user_id",                 limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "address_id",              limit: 4
    t.integer  "state_shipment_price_id", limit: 4
    t.datetime "payment_time"
    t.string   "receipt_number",          limit: 255
    t.datetime "transfer_time"
    t.boolean  "transferred"
  end

  add_index "orders", ["state_shipment_price_id"], name: "index_orders_on_state_shipment_price_id", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.datetime "data_updated_at"
    t.integer  "product_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "slug",           limit: 255
    t.text     "description",    limit: 65535
    t.decimal  "price_dropship",               precision: 10
    t.integer  "stock",          limit: 4
    t.string   "unit",           limit: 255
    t.decimal  "weight",                       precision: 10
    t.integer  "user_id",        limit: 4
    t.integer  "category_id",    limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "published"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "shipment_types", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "display_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "state_shipment_prices", force: :cascade do |t|
    t.integer  "state_id",         limit: 4
    t.integer  "shipment_type_id", limit: 4
    t.decimal  "price",                      precision: 10
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "state_shipment_prices", ["shipment_type_id"], name: "index_state_shipment_prices_on_shipment_type_id", using: :btree
  add_index "state_shipment_prices", ["state_id"], name: "index_state_shipment_prices_on_state_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "address",                   limit: 255
    t.string   "bank_account_number",       limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name",                      limit: 255
    t.string   "image_file_name",           limit: 255
    t.string   "image_content_type",        limit: 255
    t.integer  "image_file_size",           limit: 4
    t.datetime "image_updated_at"
    t.text     "description",               limit: 65535
    t.string   "banner_image_file_name",    limit: 255
    t.string   "banner_image_content_type", limit: 255
    t.integer  "banner_image_file_size",    limit: 4
    t.datetime "banner_image_updated_at"
    t.string   "bank_account_name",         limit: 255
    t.string   "bank_name",                 limit: 255
  end

  create_table "top_ups", force: :cascade do |t|
    t.decimal  "amount",                 precision: 10
    t.string   "name",       limit: 255
    t.string   "bank",       limit: 255
    t.boolean  "approved"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.decimal  "uid",                    precision: 10
  end

  add_index "top_ups", ["user_id"], name: "index_top_ups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,                default: "",   null: false
    t.string   "encrypted_password",     limit: 255,                default: "",   null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "role",                   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                  default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,                  default: 0,    null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "phone_number",           limit: 255
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "credit",                             precision: 10, default: 0
    t.integer  "supplier_id",            limit: 4
    t.boolean  "active",                                            default: true
    t.boolean  "verified"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["supplier_id"], name: "index_users_on_supplier_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "wholesale_prices", force: :cascade do |t|
    t.decimal  "price",                      precision: 10
    t.integer  "minimum_quantity", limit: 4
    t.boolean  "active"
    t.integer  "product_id",       limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "maximum_quantity", limit: 4
  end

  add_index "wholesale_prices", ["product_id"], name: "index_wholesale_prices_on_product_id", using: :btree

  add_foreign_key "addresses", "states"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "state_shipment_prices"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "state_shipment_prices", "shipment_types"
  add_foreign_key "state_shipment_prices", "states"
  add_foreign_key "top_ups", "users"
  add_foreign_key "users", "suppliers"
  add_foreign_key "wholesale_prices", "products"
end
