class CreateEcommerceShipments < ActiveRecord::Migration
  def change
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
  end
end
