# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_07_29_011755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "company_name"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.boolean "is_supplier", default: false
    t.boolean "is_customer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_internal"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "product_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_feedbacks_on_company_id"
    t.index ["product_id"], name: "index_feedbacks_on_product_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "forecast_type"
    t.bigint "product_id", null: false
    t.string "forecast_period"
    t.date "forecast_date"
    t.decimal "forecast_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_forecasts_on_product_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.decimal "weight_needed_per_batch", precision: 10, scale: 2, null: false
    t.string "unit_of_measure", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_product_id"
    t.index ["product_id"], name: "index_ingredients_on_product_id"
    t.index ["supplier_product_id"], name: "index_ingredients_on_supplier_product_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity_on_hand"
    t.integer "reorder_level"
    t.integer "reorder_quantity"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "merchandisings", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "activity_type"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "discount_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_merchandisings_on_product_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pricings_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "sku"
    t.string "category"
    t.bigint "company_id", null: false
    t.decimal "price"
    t.decimal "cost"
    t.integer "stock_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sales_count"
    t.datetime "last_sale_date"
    t.string "product_type"
    t.integer "min_lead_time"
    t.integer "min_order_quantity"
    t.integer "reorder_level"
    t.integer "reorder_quantity"
    t.string "unit_of_measure"
    t.datetime "expiration_date"
    t.decimal "weight"
    t.string "dimensions"
    t.string "storage_conditions"
    t.string "product_origin"
    t.string "certifications"
    t.boolean "hazardous_material"
    t.text "comments"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "products_purchase_orders", id: false, force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_products_purchase_orders_on_product_id"
    t.index ["purchase_order_id"], name: "index_products_purchase_orders_on_purchase_order_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "discount_type"
    t.decimal "discount_value"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_promotions_on_product_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "order_number", null: false
    t.date "order_date", null: false
    t.date "delivery_date"
    t.decimal "total_amount", precision: 10, scale: 2, null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["company_id"], name: "index_purchase_orders_on_company_id"
    t.index ["product_id"], name: "index_purchase_orders_on_product_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.decimal "total_amount"
    t.datetime "sale_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_sales_on_company_id"
  end

  create_table "sales_details", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "unit_price"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_details_on_product_id"
    t.index ["sale_id"], name: "index_sales_details_on_sale_id"
  end

  create_table "sales_targets", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "region_id", null: false
    t.bigint "store_id", null: false
    t.string "target_period"
    t.decimal "target_amount"
    t.decimal "achieved_amount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_targets_on_product_id"
    t.index ["region_id"], name: "index_sales_targets_on_region_id"
    t.index ["store_id"], name: "index_sales_targets_on_store_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_stores_on_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "status"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedbacks", "companies"
  add_foreign_key "feedbacks", "products"
  add_foreign_key "forecasts", "products"
  add_foreign_key "ingredients", "products"
  add_foreign_key "ingredients", "products", column: "supplier_product_id"
  add_foreign_key "inventories", "products"
  add_foreign_key "merchandisings", "products"
  add_foreign_key "pricings", "products"
  add_foreign_key "products", "companies"
  add_foreign_key "promotions", "products"
  add_foreign_key "purchase_orders", "companies"
  add_foreign_key "purchase_orders", "products"
  add_foreign_key "sales", "companies"
  add_foreign_key "sales_details", "products"
  add_foreign_key "sales_details", "sales"
  add_foreign_key "sales_targets", "products"
  add_foreign_key "sales_targets", "regions"
  add_foreign_key "sales_targets", "stores"
  add_foreign_key "stores", "regions"
end
