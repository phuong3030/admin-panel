class CreateEcommercePropertiesPrototypes < ActiveRecord::Migration
  def change
    create_table :ecommerce_properties_prototypes, :id => false do |t|
      t.references :prototype, index: true
      t.references :property, index: true

      t.timestamps
    end
  end
end
