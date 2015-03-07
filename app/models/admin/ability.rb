module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      alias_action :create, :update, :index, :show, :to => :crud

      user ||= Admin::User.new

      if user.role? :admin
        can :manage, :all
      elsif user.role? :moderator
        can :manage, :all
      elsif user.role? :cms_moderator
        can :manage, "Cms::Site"
        can :read, ActiveAdmin::Page, :name => "Dashboard"
      end
    end
  end
end
