class CreateFoodStoreProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.string :value

      t.references :product, index: true

      t.timestamps
    end
  end
end
