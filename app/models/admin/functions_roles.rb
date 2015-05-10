module Admin
  class FunctionsRoles < ActiveRecord::Base
    belongs_to :function, :class_name => "Admin::Function"
    belongs_to :role, :class_name => "Admin::Role"
  end
end
