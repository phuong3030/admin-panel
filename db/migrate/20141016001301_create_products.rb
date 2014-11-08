class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.text :description
      t.text :slug

      t.timestamps
    end

    add_index :products, :slug, :unique => true
  end
end
