class CreateEcommerceTaxRates < ActiveRecord::Migration
  def change
    create_table :ecommerce_tax_rates do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :include_in_price, :default => false

      t.references :zone, index: true
      t.references :tax_category, index: true

      t.timestamps
    end
  end
end
