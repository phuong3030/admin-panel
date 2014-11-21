class CreateEcommerceProductsTaxons < ActiveRecord::Migration
  def change
    create_table :ecommerce_products_taxons, :id => false do |t|
      t.references :product, index: true
      t.references :taxon, index: true

      t.timestamps
    end
  end
end
