class CreateEcommerceZones < ActiveRecord::Migration
  def change
    create_table :ecommerce_zones do |t|
      t.string :name
      t.string :description
      t.boolean :default_tax, :default => false

      t.timestamps
    end
  end
end
