class CreateEcommerceShippingCategories < ActiveRecord::Migration
  def change
    create_table :ecommerce_shipping_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
