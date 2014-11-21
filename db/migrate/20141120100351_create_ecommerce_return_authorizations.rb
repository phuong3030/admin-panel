class CreateEcommerceReturnAuthorizations < ActiveRecord::Migration
  def change
    create_table :ecommerce_return_authorizations do |t|
      t.string :number
      t.string :state
      t.decimal :amount, precision: 8, scale: 2, :null => false, :default => 0.0
      t.references :order, index: true
      t.text :reason

      t.timestamps
    end
  end
end
