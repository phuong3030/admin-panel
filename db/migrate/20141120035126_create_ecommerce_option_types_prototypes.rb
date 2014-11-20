class CreateEcommerceOptionTypesPrototypes < ActiveRecord::Migration
  def change
    create_table :ecommerce_option_types_prototypes, :id => false do |t|
      t.references :prototype, index: true
      t.references :option_type, index: true

      t.timestamps
    end
  end
end
