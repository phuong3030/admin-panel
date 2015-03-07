module Admin
  class RolesUsers < ActiveRecord::Base
    belongs_to :user, :class_name => "Admin::User"
    belongs_to :role, :class_name => "Admin::Role"
  end
end
