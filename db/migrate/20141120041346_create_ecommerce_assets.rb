class CreateEcommerceAssets < ActiveRecord::Migration
  def change
    create_table :ecommerce_assets do |t|
      t.attachment :img
      t.text :alt
      t.integer :position

      t.references :viewable, index: true, :polymorphic => true

      t.timestamps
    end
  end
end
