class CreateAdminFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.string :url
      t.boolean :display
      t.string :icon
      t.integer :functionable_id
      t.string :functionable_type

      t.timestamps
    end

    add_index :functions, :functionable_id
  end

end
