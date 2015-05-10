class CreateFunctionsRoles < ActiveRecord::Migration
  def change
    create_table :functions_roles, :id => false do |t|
      t.belongs_to :function, index: true
      t.belongs_to :role, index: true

      t.timestamps
    end
  end
end
