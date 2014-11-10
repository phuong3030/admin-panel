class CreateFoodStorePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :state

      t.references :payment_method, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
