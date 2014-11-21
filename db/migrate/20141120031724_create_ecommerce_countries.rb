class CreateEcommerceCountries < ActiveRecord::Migration
  def change
    create_table :ecommerce_countries do |t|
      t.string :name
      t.string :iso_name
      t.integer :numcode

      t.timestamps
    end
  end
end
