class CreateEcommerceStockLocations < ActiveRecord::Migration
  def change
    create_table :ecommerce_stock_locations do |t|
      t.string :name
      t.references :address, index: true

      t.timestamps
    end
  end
end
