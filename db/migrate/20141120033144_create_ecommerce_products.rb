class CreateEcommerceProducts < ActiveRecord::Migration
  def change
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
  end
end
