module Admin
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :users, :class_name => "Admin::User"
    has_many :sidebars, :class_name => "Admin::Sidebar"
    has_many :menus, :class_name => "Admin::Menu"
  end
end
