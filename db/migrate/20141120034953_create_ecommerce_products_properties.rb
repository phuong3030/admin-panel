class CreateEcommerceProductsProperties < ActiveRecord::Migration
  def change
    create_table :ecommerce_products_properties do |t|
      t.string :value
      t.references :product, index: true
      t.references :property, index: true

      t.timestamps
    end
  end
end
