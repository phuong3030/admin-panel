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

ActiveRecord::Schema.define(version: 20150307041333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ecommerce_addresses", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "phone"
    t.string   "state_name"
    t.string   "company"
    t.string   "alternative_phone"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_addresses", ["country_id"], name: "index_ecommerce_addresses_on_country_id", using: :btree
  add_index "ecommerce_addresses", ["state_id"], name: "index_ecommerce_addresses_on_state_id", using: :btree

  create_table "ecommerce_assets", force: true do |t|
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.text     "alt"
    t.integer  "position"
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_assets", ["viewable_id", "viewable_type"], name: "index_ecommerce_assets_on_viewable_id_and_viewable_type", using: :btree

  create_table "ecommerce_countries", force: true do |t|
    t.string   "name"
    t.string   "iso_name"
    t.integer  "numcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_credit_cards", force: true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "start_month"
    t.string   "start_year"
    t.string   "issue_number"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_credit_cards", ["address_id"], name: "index_ecommerce_credit_cards_on_address_id", using: :btree

  create_table "ecommerce_inventory_units", force: true do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_inventory_units", ["order_id"], name: "index_ecommerce_inventory_units_on_order_id", using: :btree
  add_index "ecommerce_inventory_units", ["return_authorization_id"], name: "index_ecommerce_inventory_units_on_return_authorization_id", using: :btree
  add_index "ecommerce_inventory_units", ["shipment_id"], name: "index_ecommerce_inventory_units_on_shipment_id", using: :btree
  add_index "ecommerce_inventory_units", ["variant_id"], name: "index_ecommerce_inventory_units_on_variant_id", using: :btree

  create_table "ecommerce_line_items", force: true do |t|
    t.integer  "quantity",                           null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.integer  "order_id"
    t.integer  "variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_line_items", ["order_id"], name: "index_ecommerce_line_items_on_order_id", using: :btree
  add_index "ecommerce_line_items", ["variant_id"], name: "index_ecommerce_line_items_on_variant_id", using: :btree

  create_table "ecommerce_option_types", force: true do |t|
    t.string   "name"
    t.string   "presentation"
    t.integer  "position",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_option_types_prototypes", id: false, force: true do |t|
    t.integer  "prototype_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_option_types_prototypes", ["option_type_id"], name: "index_ecommerce_option_types_prototypes_on_option_type_id", using: :btree
  add_index "ecommerce_option_types_prototypes", ["prototype_id"], name: "index_ecommerce_option_types_prototypes_on_prototype_id", using: :btree

  create_table "ecommerce_option_values", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_option_values", ["option_type_id"], name: "index_ecommerce_option_values_on_option_type_id", using: :btree

  create_table "ecommerce_option_values_variants", id: false, force: true do |t|
    t.integer  "variant_id"
    t.integer  "option_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_option_values_variants", ["option_value_id"], name: "index_ecommerce_option_values_variants_on_option_value_id", using: :btree
  add_index "ecommerce_option_values_variants", ["variant_id"], name: "index_ecommerce_option_values_variants_on_variant_id", using: :btree

  create_table "ecommerce_orders", force: true do |t|
    t.string   "number"
    t.decimal  "item_total",           precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "total",                precision: 8, scale: 2, default: 0.0, null: false
    t.string   "state"
    t.decimal  "adjustment_total",     precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "completed_at"
    t.decimal  "payment_total",        precision: 8, scale: 2, default: 0.0, null: false
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.integer  "user_id"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.integer  "shipping_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_orders", ["bill_address_id"], name: "index_ecommerce_orders_on_bill_address_id", using: :btree
  add_index "ecommerce_orders", ["ship_address_id"], name: "index_ecommerce_orders_on_ship_address_id", using: :btree
  add_index "ecommerce_orders", ["shipping_method_id"], name: "index_ecommerce_orders_on_shipping_method_id", using: :btree
  add_index "ecommerce_orders", ["user_id"], name: "index_ecommerce_orders_on_user_id", using: :btree

  create_table "ecommerce_payment_methods", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "display_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_payments", force: true do |t|
    t.decimal  "amount",            precision: 8, scale: 2, default: 0.0, null: false
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_payments", ["order_id"], name: "index_ecommerce_payments_on_order_id", using: :btree
  add_index "ecommerce_payments", ["payment_method_id"], name: "index_ecommerce_payments_on_payment_method_id", using: :btree
  add_index "ecommerce_payments", ["source_id", "source_type"], name: "index_ecommerce_payments_on_source_id_and_source_type", using: :btree

  create_table "ecommerce_products", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.datetime "available_on"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "count_on_hand"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products", ["shipping_category_id"], name: "index_ecommerce_products_on_shipping_category_id", using: :btree
  add_index "ecommerce_products", ["slug"], name: "index_ecommerce_products_on_slug", using: :btree
  add_index "ecommerce_products", ["tax_category_id"], name: "index_ecommerce_products_on_tax_category_id", using: :btree

  create_table "ecommerce_products_option_types", force: true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products_option_types", ["option_type_id"], name: "index_ecommerce_products_option_types_on_option_type_id", using: :btree
  add_index "ecommerce_products_option_types", ["product_id"], name: "index_ecommerce_products_option_types_on_product_id", using: :btree

  create_table "ecommerce_products_properties", force: true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products_properties", ["product_id"], name: "index_ecommerce_products_properties_on_product_id", using: :btree
  add_index "ecommerce_products_properties", ["property_id"], name: "index_ecommerce_products_properties_on_property_id", using: :btree

  create_table "ecommerce_properties", force: true do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_properties_prototypes", id: false, force: true do |t|
    t.integer  "prototype_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_properties_prototypes", ["property_id"], name: "index_ecommerce_properties_prototypes_on_property_id", using: :btree
  add_index "ecommerce_properties_prototypes", ["prototype_id"], name: "index_ecommerce_properties_prototypes_on_prototype_id", using: :btree

  create_table "ecommerce_prototypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_return_authorizations", force: true do |t|
    t.string   "number"
    t.string   "state"
    t.decimal  "amount",     precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "order_id"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_return_authorizations", ["order_id"], name: "index_ecommerce_return_authorizations_on_order_id", using: :btree

  create_table "ecommerce_shipments", force: true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",               precision: 8, scale: 2
    t.datetime "shipped_at"
    t.string   "state"
    t.integer  "order_id"
    t.integer  "shipping_method_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_shipments", ["address_id"], name: "index_ecommerce_shipments_on_address_id", using: :btree
  add_index "ecommerce_shipments", ["order_id"], name: "index_ecommerce_shipments_on_order_id", using: :btree
  add_index "ecommerce_shipments", ["shipping_method_id"], name: "index_ecommerce_shipments_on_shipping_method_id", using: :btree

  create_table "ecommerce_shipping_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_shipping_methods", force: true do |t|
    t.string   "name"
    t.string   "display_on"
    t.integer  "shipping_category_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_shipping_methods", ["shipping_category_id"], name: "index_ecommerce_shipping_methods_on_shipping_category_id", using: :btree
  add_index "ecommerce_shipping_methods", ["zone_id"], name: "index_ecommerce_shipping_methods_on_zone_id", using: :btree

  create_table "ecommerce_states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_states", ["country_id"], name: "index_ecommerce_states_on_country_id", using: :btree

  create_table "ecommerce_stock_items", force: true do |t|
    t.integer  "count_on_hand"
    t.integer  "variant_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_stock_items", ["stock_location_id"], name: "index_ecommerce_stock_items_on_stock_location_id", using: :btree
  add_index "ecommerce_stock_items", ["variant_id"], name: "index_ecommerce_stock_items_on_variant_id", using: :btree

  create_table "ecommerce_stock_locations", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_stock_locations", ["address_id"], name: "index_ecommerce_stock_locations_on_address_id", using: :btree

  create_table "ecommerce_tax_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_default",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_tax_rates", force: true do |t|
    t.decimal  "amount",           precision: 8, scale: 2
    t.boolean  "include_in_price",                         default: false
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_tax_rates", ["tax_category_id"], name: "index_ecommerce_tax_rates_on_tax_category_id", using: :btree
  add_index "ecommerce_tax_rates", ["zone_id"], name: "index_ecommerce_tax_rates_on_zone_id", using: :btree

  create_table "ecommerce_taxonomies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecommerce_taxons", force: true do |t|
    t.integer  "position"
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.integer  "taxonomy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_taxons", ["parent_id"], name: "index_ecommerce_taxons_on_parent_id", using: :btree
  add_index "ecommerce_taxons", ["taxonomy_id"], name: "index_ecommerce_taxons_on_taxonomy_id", using: :btree

  create_table "ecommerce_variants", force: true do |t|
    t.string   "sku",                                   default: "", null: false
    t.decimal  "price",         precision: 8, scale: 2,              null: false
    t.decimal  "weight",        precision: 8, scale: 2,              null: false
    t.decimal  "height",        precision: 8, scale: 2,              null: false
    t.decimal  "width",         precision: 8, scale: 2,              null: false
    t.decimal  "depth",         precision: 8, scale: 2,              null: false
    t.boolean  "is_master"
    t.integer  "count_on_hand"
    t.decimal  "cost_price",    precision: 8, scale: 2,              null: false
    t.integer  "position"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_variants", ["product_id"], name: "index_ecommerce_variants_on_product_id", using: :btree

  create_table "ecommerce_zones", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "display"
    t.string   "icon"
    t.string   "type"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "functions", ["ancestry"], name: "index_functions_on_ancestry", using: :btree
  add_index "functions", ["role_id"], name: "index_functions_on_role_id", using: :btree
  add_index "functions", ["type"], name: "index_functions_on_type", using: :btree

  create_table "functions_roles", id: false, force: true do |t|
    t.integer  "function_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "functions_roles", ["function_id"], name: "index_functions_roles_on_function_id", using: :btree
  add_index "functions_roles", ["role_id"], name: "index_functions_roles_on_role_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "type"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["bill_address_id"], name: "index_users_on_bill_address_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["ship_address_id"], name: "index_users_on_ship_address_id", using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", name: "mb_opt_outs_on_conversations_id", column: "conversation_id"

  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", name: "notifications_on_conversation_id", column: "conversation_id"

  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", name: "receipts_on_notification_id", column: "notification_id"

end
