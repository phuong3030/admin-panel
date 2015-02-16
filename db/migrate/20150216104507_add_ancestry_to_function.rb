class AddAncestryToFunction < ActiveRecord::Migration
  def up
    add_column :functions, :ancestry, :string
    add_index :functions, :ancestry
  end
  def down
    remove_index :functions, :ancestry
    remove_column :functions, :ancestry
  end
end
