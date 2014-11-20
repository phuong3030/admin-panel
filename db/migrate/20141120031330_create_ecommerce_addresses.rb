class CreateEcommerceAddresses < ActiveRecord::Migration
  def change
    create_table :ecommerce_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :phone
      t.string :state_name
      t.string :company
      t.string :alternative_phone
      t.references :state, index: true
      t.references :country, index: true

      t.timestamps
    end
  end
end
