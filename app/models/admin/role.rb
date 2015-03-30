module Admin
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :groups, class_name: "Admin::Group"
    has_and_belongs_to_many :functions, class_name: "Admin::Function"

    has_many :functions_roles, class_name: "Admin::FunctionsRoles"
    has_many :sidebars, class_name: "Admin::Sidebar", through: :functions_roles, source: :function
    has_many :menus, class_name: "Admin::Menu", through: :functions_roles, source: :function

    validates_uniqueness_of :name
  end
end
