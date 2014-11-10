class CreateCategories < ActiveRecord::Migration
  def change
    create_table :food_store_categories do |t|
      t.string :name
      t.text :description
      t.text :slug 

      t.timestamps
    end

    add_index :food_store_categories, :slug, :unique => true
  end
end
