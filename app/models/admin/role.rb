module Admin
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :users, class_name: "Admin::User"
    has_and_belongs_to_many :functions, class_name: "Admin::Function"

    has_many :functions_roles, class_name: "Admin::FunctionsRoles"
    has_many :sidebars, class_name: "Admin::Sidebar", through: :functions_roles, source: :function
    has_many :menus, class_name: "Admin::Menu", through: :functions_roles, source: :function
  end
end
