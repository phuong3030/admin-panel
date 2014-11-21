class CreateEcommercePayments < ActiveRecord::Migration
  def change
    create_table :ecommerce_payments do |t|
      t.decimal :amount, precision: 8, scale: 2, :default => 0.0, :null => false
      t.string :state
      t.string :response_code
      t.string :avs_response

      t.references :source, index: true, :polymorphic => true
      t.references :payment_method, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
