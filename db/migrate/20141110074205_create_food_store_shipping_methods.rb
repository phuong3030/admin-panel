class CreateFoodStoreShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
