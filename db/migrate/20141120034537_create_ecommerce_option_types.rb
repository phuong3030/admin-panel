class CreateEcommerceOptionTypes < ActiveRecord::Migration
  def change
    create_table :ecommerce_option_types do |t|
      t.string :name
      t.string :presentation 
      t.integer :position, :default => 0, :null => false

      t.timestamps
    end
  end
end
