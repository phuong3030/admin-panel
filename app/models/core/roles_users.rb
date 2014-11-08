module Core
  class RolesUsers < ActiveRecord::Base
    belongs_to :user, :class_name => "Core::User"
    belongs_to :Role, :class_name => "Core::Role"
  end
end
