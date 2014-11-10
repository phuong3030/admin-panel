class CreateFoodStoreAssets < ActiveRecord::Migration
  def change
    create_table :food_store_assets do |t|
      t.attachment :attachment

      t.references :product

      t.timestamps
    end
  end
end
