class CreateFoodStoreVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku
      t.decimal :price
      t.decimal :weight
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.boolean :is_master
      t.integer :count_on_hand

      t.references :product, index: true

      t.timestamps
    end
  end
end
