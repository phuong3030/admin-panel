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

ActiveRecord::Schema.define(version: 20141120145325) do

  create_table "comfy_cms_blocks", force: true do |t|
    t.string   "identifier",                      null: false
    t.text     "content",        limit: 16777215
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type"
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier"

  create_table "comfy_cms_categories", force: true do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true

  create_table "comfy_cms_categorizations", force: true do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true

  create_table "comfy_cms_files", force: true do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id"
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name"
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label"
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position"

  create_table "comfy_cms_layouts", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.text     "css",        limit: 16777215
    t.text     "js",         limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position"
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true

  create_table "comfy_cms_pages", force: true do |t|
    t.integer  "site_id",                                         null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                           null: false
    t.string   "slug"
    t.string   "full_path",                                       null: false
    t.text     "content_cache",  limit: 16777215
    t.integer  "position",                        default: 0,     null: false
    t.integer  "children_count",                  default: 0,     null: false
    t.boolean  "is_published",                    default: true,  null: false
    t.boolean  "is_shared",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position"
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path"

  create_table "comfy_cms_revisions", force: true do |t|
    t.string   "record_type",                  null: false
    t.integer  "record_id",                    null: false
    t.text     "data",        limit: 16777215
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at"

  create_table "comfy_cms_sites", force: true do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname"
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored"

  create_table "comfy_cms_snippets", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position"

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

  add_index "ecommerce_addresses", ["country_id"], name: "index_ecommerce_addresses_on_country_id"
  add_index "ecommerce_addresses", ["state_id"], name: "index_ecommerce_addresses_on_state_id"

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

  add_index "ecommerce_assets", ["viewable_id", "viewable_type"], name: "index_ecommerce_assets_on_viewable_id_and_viewable_type"

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

  add_index "ecommerce_credit_cards", ["address_id"], name: "index_ecommerce_credit_cards_on_address_id"

  create_table "ecommerce_inventory_units", force: true do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_inventory_units", ["order_id"], name: "index_ecommerce_inventory_units_on_order_id"
  add_index "ecommerce_inventory_units", ["return_authorization_id"], name: "index_ecommerce_inventory_units_on_return_authorization_id"
  add_index "ecommerce_inventory_units", ["shipment_id"], name: "index_ecommerce_inventory_units_on_shipment_id"
  add_index "ecommerce_inventory_units", ["variant_id"], name: "index_ecommerce_inventory_units_on_variant_id"

  create_table "ecommerce_line_items", force: true do |t|
    t.integer  "quantity",                           null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.integer  "order_id"
    t.integer  "variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_line_items", ["order_id"], name: "index_ecommerce_line_items_on_order_id"
  add_index "ecommerce_line_items", ["variant_id"], name: "index_ecommerce_line_items_on_variant_id"

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

  add_index "ecommerce_option_types_prototypes", ["option_type_id"], name: "index_ecommerce_option_types_prototypes_on_option_type_id"
  add_index "ecommerce_option_types_prototypes", ["prototype_id"], name: "index_ecommerce_option_types_prototypes_on_prototype_id"

  create_table "ecommerce_option_values", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_option_values", ["option_type_id"], name: "index_ecommerce_option_values_on_option_type_id"

  create_table "ecommerce_option_values_variants", id: false, force: true do |t|
    t.integer  "variant_id"
    t.integer  "option_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_option_values_variants", ["option_value_id"], name: "index_ecommerce_option_values_variants_on_option_value_id"
  add_index "ecommerce_option_values_variants", ["variant_id"], name: "index_ecommerce_option_values_variants_on_variant_id"

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

  add_index "ecommerce_orders", ["bill_address_id"], name: "index_ecommerce_orders_on_bill_address_id"
  add_index "ecommerce_orders", ["ship_address_id"], name: "index_ecommerce_orders_on_ship_address_id"
  add_index "ecommerce_orders", ["shipping_method_id"], name: "index_ecommerce_orders_on_shipping_method_id"
  add_index "ecommerce_orders", ["user_id"], name: "index_ecommerce_orders_on_user_id"

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

  add_index "ecommerce_payments", ["order_id"], name: "index_ecommerce_payments_on_order_id"
  add_index "ecommerce_payments", ["payment_method_id"], name: "index_ecommerce_payments_on_payment_method_id"
  add_index "ecommerce_payments", ["source_id", "source_type"], name: "index_ecommerce_payments_on_source_id_and_source_type"

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

  add_index "ecommerce_products", ["shipping_category_id"], name: "index_ecommerce_products_on_shipping_category_id"
  add_index "ecommerce_products", ["slug"], name: "index_ecommerce_products_on_slug"
  add_index "ecommerce_products", ["tax_category_id"], name: "index_ecommerce_products_on_tax_category_id"

  create_table "ecommerce_products_option_types", force: true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products_option_types", ["option_type_id"], name: "index_ecommerce_products_option_types_on_option_type_id"
  add_index "ecommerce_products_option_types", ["product_id"], name: "index_ecommerce_products_option_types_on_product_id"

  create_table "ecommerce_products_properties", force: true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products_properties", ["product_id"], name: "index_ecommerce_products_properties_on_product_id"
  add_index "ecommerce_products_properties", ["property_id"], name: "index_ecommerce_products_properties_on_property_id"

  create_table "ecommerce_products_taxons", id: false, force: true do |t|
    t.integer  "product_id"
    t.integer  "taxon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_products_taxons", ["product_id"], name: "index_ecommerce_products_taxons_on_product_id"
  add_index "ecommerce_products_taxons", ["taxon_id"], name: "index_ecommerce_products_taxons_on_taxon_id"

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

  add_index "ecommerce_properties_prototypes", ["property_id"], name: "index_ecommerce_properties_prototypes_on_property_id"
  add_index "ecommerce_properties_prototypes", ["prototype_id"], name: "index_ecommerce_properties_prototypes_on_prototype_id"

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

  add_index "ecommerce_return_authorizations", ["order_id"], name: "index_ecommerce_return_authorizations_on_order_id"

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

  add_index "ecommerce_shipments", ["address_id"], name: "index_ecommerce_shipments_on_address_id"
  add_index "ecommerce_shipments", ["order_id"], name: "index_ecommerce_shipments_on_order_id"
  add_index "ecommerce_shipments", ["shipping_method_id"], name: "index_ecommerce_shipments_on_shipping_method_id"

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

  add_index "ecommerce_shipping_methods", ["shipping_category_id"], name: "index_ecommerce_shipping_methods_on_shipping_category_id"
  add_index "ecommerce_shipping_methods", ["zone_id"], name: "index_ecommerce_shipping_methods_on_zone_id"

  create_table "ecommerce_states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_states", ["country_id"], name: "index_ecommerce_states_on_country_id"

  create_table "ecommerce_stock_items", force: true do |t|
    t.integer  "count_on_hand"
    t.integer  "variant_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_stock_items", ["stock_location_id"], name: "index_ecommerce_stock_items_on_stock_location_id"
  add_index "ecommerce_stock_items", ["variant_id"], name: "index_ecommerce_stock_items_on_variant_id"

  create_table "ecommerce_stock_locations", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecommerce_stock_locations", ["address_id"], name: "index_ecommerce_stock_locations_on_address_id"

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

  add_index "ecommerce_tax_rates", ["tax_category_id"], name: "index_ecommerce_tax_rates_on_tax_category_id"
  add_index "ecommerce_tax_rates", ["zone_id"], name: "index_ecommerce_tax_rates_on_zone_id"

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

  add_index "ecommerce_taxons", ["parent_id"], name: "index_ecommerce_taxons_on_parent_id"
  add_index "ecommerce_taxons", ["taxonomy_id"], name: "index_ecommerce_taxons_on_taxonomy_id"

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

  add_index "ecommerce_variants", ["product_id"], name: "index_ecommerce_variants_on_product_id"

  create_table "ecommerce_zones", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["bill_address_id"], name: "index_users_on_bill_address_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["ship_address_id"], name: "index_users_on_ship_address_id"

end
