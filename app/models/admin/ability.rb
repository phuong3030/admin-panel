module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      alias_action :create, :update, :index, :show, :to => :crud

      user ||= Admin::User.new

      if user.group.role? :admin
        can :manage, :all
      elsif user.group.role? :moderator
        can :manage, :all
      end
    end
  end
end
