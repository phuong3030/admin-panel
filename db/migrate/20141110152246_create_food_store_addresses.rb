class CreateFoodStoreAddresses < ActiveRecord::Migration
  def change
    create_table :food_store_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :phone
      t.string :company

      t.timestamps
    end
  end
end
