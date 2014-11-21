class CreateEcommerceProperties < ActiveRecord::Migration
  def change
    create_table :ecommerce_properties do |t|
      t.string :name
      t.string :presentation, :null => false

      t.timestamps
    end
  end
end
