class CreateFoodStoreLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :price
      t.integer :quantity

      t.references :order, index: true
      t.references :variant, index: true

      t.timestamps
    end
  end
end
