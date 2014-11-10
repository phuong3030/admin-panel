class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.text :description
      t.datetime :available_on
      
      t.text :slug

      t.timestamps
    end

    add_index :products, :slug, :unique => true
    add_index :products, :name
    add_index :products, :available_on
  end
end
