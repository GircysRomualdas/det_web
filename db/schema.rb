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

ActiveRecord::Schema[7.0].define(version: 2024_02_21_135432) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.integer "brand_id"
    t.string "name"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_preps", force: :cascade do |t|
    t.integer "order_prep_id"
    t.integer "detail_id"
    t.integer "car_id"
    t.string "car_name"
    t.integer "supplier_id"
    t.string "supplier_name"
    t.integer "order_type_id"
    t.string "order_type_name"
    t.string "delivery_days"
    t.string "code"
    t.string "name", limit: 50
    t.string "comment", limit: 50, default: ""
    t.float "price"
    t.float "price_with_tax"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_prep_id"], name: "index_detail_preps_on_order_prep_id"
  end

  create_table "details", force: :cascade do |t|
    t.integer "order_id"
    t.string "part_name", limit: 50
    t.string "part_code"
    t.string "comment", limit: 50
    t.string "kiekis"
    t.integer "qnt"
    t.float "our_price"
    t.integer "supplier_id"
    t.string "supplier"
    t.float "price_wo_tax_all"
    t.float "price_with_tax"
    t.string "status"
    t.integer "status_id"
    t.integer "inovice_count"
    t.integer "woinovice_count"
    t.string "icon"
    t.string "qnt_confirmed"
    t.float "onepart_price_with_tax"
    t.string "qnt_packed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_details_on_order_id"
  end

  create_table "find_detail_preps", force: :cascade do |t|
    t.integer "detail_id"
    t.integer "car_id"
    t.string "car_name"
    t.integer "supplier_id"
    t.string "supplier_name"
    t.integer "order_type_id"
    t.string "order_type_name"
    t.string "delivery_days"
    t.string "code"
    t.string "name", limit: 50
    t.string "comment", limit: 50, default: ""
    t.float "price"
    t.float "price_with_tax"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_preps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_order_preps_on_brand_id"
    t.index ["user_id"], name: "index_order_preps_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "sid"
    t.integer "client_id"
    t.string "client"
    t.string "vehicle_brand"
    t.string "vehicle_model"
    t.string "vin"
    t.string "status"
    t.datetime "creation_date"
    t.string "color"
    t.string "icon"
    t.string "supplierlist"
    t.string "codelist"
    t.datetime "dtcreation_date"
    t.float "sum_price_wo_tax_all"
    t.integer "count_ordered_parts"
    t.integer "count_canceled_parts"
    t.integer "count_changed_price_parts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "company_name", default: ""
    t.integer "surcharge_id"
    t.string "surcharge_name", default: ""
    t.integer "is_foreign_customer"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
