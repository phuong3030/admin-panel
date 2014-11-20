class CreateEcommerceShippingMethods < ActiveRecord::Migration
  def change
    create_table :ecommerce_shipping_methods do |t|
      t.string :name
      t.string :display_on
      t.references :shipping_category, index: true
      t.references :zone, index: true

      t.timestamps
    end
  end
end
