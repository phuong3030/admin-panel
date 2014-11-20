class CreateEcommerceInventoryUnits < ActiveRecord::Migration
  def change
    create_table :ecommerce_inventory_units do |t|
      t.string :state
      t.references :variant, index: true
      t.references :order, index: true
      t.references :shipment, index: true
      t.references :return_authorization, index: true

      t.timestamps
    end
  end
end
