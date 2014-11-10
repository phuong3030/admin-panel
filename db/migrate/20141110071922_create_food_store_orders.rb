class CreateFoodStoreOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :item_total
      t.integer :total
      t.integer :adjustment_total
      t.datetime :completed_at
      t.string :email
      t.string :special_instructions
      t.string :state
      t.decimal :payment_total

      t.references :customer, index: true
      t.references :supplier, index: true
      t.references :shipping_method, index: true
      t.references :bill_address, index: true
      t.references :ship_address, index: true
 
      t.timestamps
    end
  end
end
