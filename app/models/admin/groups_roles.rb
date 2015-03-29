module Admin
  class GroupsRoles< ActiveRecord::Base
    belongs_to :group, :class_name => "Admin::Group"
    belongs_to :role, :class_name => "Admin::Role"
  end
end
