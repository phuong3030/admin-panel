class CreateEcommerceOrders < ActiveRecord::Migration
  def change
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
  end
end
