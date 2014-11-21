class CreateEcommerceLineItems < ActiveRecord::Migration
  def change
    create_table :ecommerce_line_items do |t|
      t.integer :quantity, :null => false
      t.decimal :price, precision: 8, scale: 2, :null => false

      t.references :order, index: true
      t.references :variant, index: true

      t.timestamps
    end
  end
end
