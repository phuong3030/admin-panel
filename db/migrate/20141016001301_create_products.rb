class CreateProducts < ActiveRecord::Migration
  def change
    create_table :food_store_products do |t|
      t.belongs_to :category
      t.string :name
      t.text :description
      t.datetime :available_on
      
      t.text :slug

      t.timestamps
    end

    add_index :food_store_products, :slug, :unique => true
    add_index :food_store_products, :name
    add_index :food_store_products, :available_on
  end
end
