class CreateEcommerceOptionValuesVariants < ActiveRecord::Migration
  def change
    create_table :ecommerce_option_values_variants, :id => false do |t|
      t.references :variant, index: true
      t.references :option_value, index: true

      t.timestamps
    end
  end
end
