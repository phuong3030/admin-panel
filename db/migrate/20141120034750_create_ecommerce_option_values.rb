class CreateEcommerceOptionValues < ActiveRecord::Migration
  def change
    create_table :ecommerce_option_values do |t|
      t.string :name
      t.integer :position
      t.string :presentation

      t.references :option_type, index: true

      t.timestamps
    end
  end
end
