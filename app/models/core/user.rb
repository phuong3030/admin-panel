module Core
  class User < ActiveRecord::Base

    has_and_belongs_to_many :roles, :class_name => "Core::Role"

    devise :database_authenticatable, 
      :recoverable, :rememberable, :trackable, :validatable

    def role_array
      self.roles.pluck(:name)
    end

    def role?(role)
      role_array.include?(role.to_s)
    end

    def add_role(role)
      self.update_attributes(accepted_at: Time.now) if self.is_only_potential?
      self.user_roles.create(role_id: Role.find_by(role: role).id ) if !self.role?(role)
    end

    def remove_role(role)
      self.user_roles.find_by( role_id: Role.find_by(role: role).id ).destroy if self.role?(role)
    end

  end
end
