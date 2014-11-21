class CreateEcommercePrototypes < ActiveRecord::Migration
  def change
    create_table :ecommerce_prototypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
