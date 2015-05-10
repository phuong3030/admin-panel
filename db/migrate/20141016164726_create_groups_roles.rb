class CreateGroupsRoles < ActiveRecord::Migration
  def change
    create_table :groups_roles, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :role, index: true

      t.timestamps
    end
  end
end
