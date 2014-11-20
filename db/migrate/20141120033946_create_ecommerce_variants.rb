class CreateEcommerceVariants < ActiveRecord::Migration
  def change
    create_table :ecommerce_variants do |t|
      t.string :sku, :default => "", :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.decimal :weight, :precision => 8, :scale => 2, :null => false
      t.decimal :height, :precision => 8, :scale => 2, :null => false
      t.decimal :width, :precision => 8, :scale => 2, :null => false
      t.decimal :depth, :precision => 8, :scale => 2, :null => false
      t.boolean :is_master
      t.integer :count_on_hand
      t.decimal :cost_price, :precision => 8, :scale => 2, :null => false
      t.integer :position

      t.references :product, index: true

      t.timestamps
    end
  end
end
