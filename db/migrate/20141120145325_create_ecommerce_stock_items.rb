class CreateEcommerceStockItems < ActiveRecord::Migration
  def change
    create_table :ecommerce_stock_items do |t|
      t.integer :count_on_hand
      t.references :variant, index: true
      t.references :stock_location, index: true

      t.timestamps
    end
  end
end
