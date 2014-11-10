class CreateFoodStoreShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :number
      t.string :tracking
      t.decimal :cost
      t.datetime :shipped_at
      t.references :order, index: true
      t.references :shipping_method, index: true
      t.references :address, index: true
      t.string :state

      t.timestamps
    end
  end
end
