class CreateEcommerceTaxCategories < ActiveRecord::Migration
  def change
    create_table :ecommerce_tax_categories do |t|
      t.string :name
      t.text :description
      t.boolean :is_default, :default => false

      t.timestamps
    end
  end
end
