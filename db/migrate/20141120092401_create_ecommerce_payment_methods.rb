class CreateEcommercePaymentMethods < ActiveRecord::Migration
  def change
    create_table :ecommerce_payment_methods do |t|
      t.string :name
      t.string :type
      t.text :description
      t.boolean :active, :default => true
      t.string :display_on

      t.timestamps
    end
  end
end
