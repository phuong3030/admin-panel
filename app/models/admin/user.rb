module Admin
  class User < ActiveRecord::Base
    has_and_belongs_to_many :roles, :class_name => "Admin::Role"

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
      self.user_roles.find_by(role_id: Role.find_by(role: role).id ).destroy if self.role?(role)
    end

    # Get all ui can be used by user role
    def get_ui_by_role(ui_type)
      ui_type = (ui_type + 's').to_sym
      ui = Admin::Function.arrange_nodes(self.roles.map { |role| role.send(ui_type) }.flatten.sort_by { |h| h.id })
      Admin::Function.json_tree(ui)
    end
  end
end
