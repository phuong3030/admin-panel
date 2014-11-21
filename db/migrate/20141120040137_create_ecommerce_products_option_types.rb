class CreateEcommerceProductsOptionTypes < ActiveRecord::Migration
  def change
    create_table :ecommerce_products_option_types do |t|
      t.integer :position

      t.references :product, index: true
      t.references :option_type, index: true

      t.timestamps
    end
  end
end
