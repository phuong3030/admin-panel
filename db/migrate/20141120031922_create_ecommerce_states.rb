class CreateEcommerceStates < ActiveRecord::Migration
  def change
    create_table :ecommerce_states do |t|
      t.string :name
      t.string :abbr
      t.references :country, index: true

      t.timestamps
    end
  end
end
