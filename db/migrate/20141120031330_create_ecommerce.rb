class CreateEcommerceAddresses < ActiveRecord::Migration
  def change
    create_table :ecommerce_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :phone
      t.string :state_name
      t.string :company
      t.string :alternative_phone

      t.references :state, index: true
      t.references :country, index: true

      t.timestamps
    end

    create_table :ecommerce_countries do |t|
      t.string :name
      t.string :iso_name
      t.integer :numcode

      t.timestamps
    end

    create_table :ecommerce_states do |t|
      t.string :name
      t.string :abbr

      t.references :country, index: true

      t.timestamps
    end

    create_table :ecommerce_taxonomies do |t|
      t.string :name

      t.timestamps
    end

    create_table :ecommerce_taxons do |t|
      t.integer :position
      t.string :name
      t.text :description

      t.references :parent, index: true
      t.references :taxonomy, index: true

      t.timestamps
    end

    create_table :ecommerce_products do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.datetime :available_on
      t.string :meta_description
      t.string :meta_keywords
      t.integer :count_on_hand

      t.references :tax_category, index: true
      t.references :shipping_category, index: true

      t.timestamps
    end

    add_index :ecommerce_products, :slug

    create_table :ecommerce_variants do |t|
      t.string :sku, :default => "", :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.decimal :weight, :precision => 8, :scale => 2, :null => false
      t.decimal :height, :precision => 8, :scale => 2, :null => false
      t.decimal :width, :precision => 8, :scale => 2, :null => false
      t.decimal :depth, :precision => 8, :scale => 2, :null => false
      t.boolean :is_master
      t.integer :count_on_hand
      t.decimal :cost_price, :precision => 8, :scale => 2, :null => false
      t.integer :position

      t.references :product, index: true

      t.timestamps
    end

    create_table :ecommerce_properties do |t|
      t.string :name
      t.string :presentation, :null => false

      t.timestamps
    end

    create_table :ecommerce_prototypes do |t|
      t.string :name

      t.timestamps
    end

    create_table :ecommerce_option_types do |t|
      t.string :name
      t.string :presentation 
      t.integer :position, :default => 0, :null => false

      t.timestamps
    end

    create_table :ecommerce_option_values do |t|
      t.string :name
      t.integer :position
      t.string :presentation

      t.references :option_type, index: true

      t.timestamps
    end

    create_table :ecommerce_products_properties do |t|
      t.string :value

      t.references :product, index: true
      t.references :property, index: true

      t.timestamps
    end

    create_table :ecommerce_option_types_prototypes, :id => false do |t|
      t.references :prototype, index: true
      t.references :option_type, index: true

      t.timestamps
    end

    create_table :ecommerce_option_values_variants, :id => false do |t|
      t.references :variant, index: true
      t.references :option_value, index: true

      t.timestamps
    end

    create_table :ecommerce_properties_prototypes, :id => false do |t|
      t.references :prototype, index: true
      t.references :property, index: true

      t.timestamps
    end

    create_table :ecommerce_products_option_types do |t|
      t.integer :position

      t.references :product, index: true
      t.references :option_type, index: true

      t.timestamps
    end

    create_table :ecommerce_assets do |t|
      t.attachment :img
      t.text :alt
      t.integer :position

      t.references :viewable, index: true, :polymorphic => true

      t.timestamps
    end

    create_table :ecommerce_shipping_categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :ecommerce_shipping_methods do |t|
      t.string :name
      t.string :display_on
      
      t.references :shipping_category, index: true
      t.references :zone, index: true

      t.timestamps
    end

    create_table :ecommerce_zones do |t|
      t.string :name
      t.string :description
      t.boolean :default_tax, :default => false

      t.timestamps
    end

    create_table :ecommerce_tax_categories do |t|
      t.string :name
      t.text :description
      t.boolean :is_default, :default => false

      t.timestamps
    end

    create_table :ecommerce_tax_rates do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :include_in_price, :default => false

      t.references :zone, index: true
      t.references :tax_category, index: true

      t.timestamps
    end

    create_table :ecommerce_orders do |t|
      t.string :number
      t.decimal :item_total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string :state
      t.decimal :adjustment_total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.datetime :completed_at
      t.decimal :payment_total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string :shipment_state
      t.string :payment_state
      t.string :email
      t.text :special_instructions

      t.references :user, index: true
      t.references :bill_address, index: true
      t.references :ship_address, index: true
      t.references :shipping_method, index: true

      t.timestamps
    end

    create_table :ecommerce_payment_methods do |t|
      t.string :name
      t.string :type
      t.text :description
      t.boolean :active, :default => true
      t.string :display_on

      t.timestamps
    end

    create_table :ecommerce_payments do |t|
      t.decimal :amount, precision: 8, scale: 2, :default => 0.0, :null => false
      t.string :state
      t.string :response_code
      t.string :avs_response

      t.references :source, index: true, :polymorphic => true
      t.references :payment_method, index: true
      t.references :order, index: true

      t.timestamps
    end

    create_table :ecommerce_credit_cards do |t|
      t.string :month
      t.string :year
      t.string :cc_type
      t.string :last_digits
      t.string :firstname
      t.string :lastname
      t.string :start_month
      t.string :start_year
      t.string :issue_number
      t.string :gateway_customer_profile_id
      t.string :gateway_payment_profile_id

      t.references :address, index: true

      t.timestamps
    end

    create_table :ecommerce_line_items do |t|
      t.integer :quantity, :null => false
      t.decimal :price, precision: 8, scale: 2, :null => false

      t.references :order, index: true
      t.references :variant, index: true

      t.timestamps
    end

    create_table :ecommerce_shipments do |t|
      t.string :tracking
      t.string :number
      t.decimal :cost, precision: 8, scale: 2
      t.datetime :shipped_at
      t.string :state
      t.references :order, index: true
      t.references :shipping_method, index: true
      t.references :address, index: true

      t.timestamps
    end

    create_table :ecommerce_inventory_units do |t|
      t.string :state
      t.references :variant, index: true
      t.references :order, index: true
      t.references :shipment, index: true
      t.references :return_authorization, index: true

      t.timestamps
    end

    create_table :ecommerce_return_authorizations do |t|
      t.string :number
      t.string :state
      t.decimal :amount, precision: 8, scale: 2, :null => false, :default => 0.0
      t.references :order, index: true
      t.text :reason

      t.timestamps
    end

    create_table :ecommerce_stock_locations do |t|
      t.string :name
      t.references :address, index: true

      t.timestamps
    end

    create_table :ecommerce_stock_items do |t|
      t.integer :count_on_hand
      t.references :variant, index: true
      t.references :stock_location, index: true

      t.timestamps
    end
  end
end
