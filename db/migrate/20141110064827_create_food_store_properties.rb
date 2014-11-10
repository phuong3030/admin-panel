class CreateFoodStoreProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name

      t.references :product, index: true
      t.references :property, index: true

      t.timestamps
    end
  end
end
