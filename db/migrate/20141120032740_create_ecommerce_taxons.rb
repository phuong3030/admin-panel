class CreateEcommerceTaxons < ActiveRecord::Migration
  def change
    create_table :ecommerce_taxons do |t|
      t.integer :position
      t.string :name
      t.text :description
      t.references :parent, index: true
      t.references :taxonomy, index: true

      t.timestamps
    end
  end
end
