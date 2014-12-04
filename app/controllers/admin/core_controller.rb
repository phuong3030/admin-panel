module Admin
  class CoreController < ApplicationController

    layout 'admin'

    before_action :authenticate_admin, :except => [:login]

    # GET /admin
    def index
    end

    # GET /admin/login
    def login
    end

    private
      def authenticate_admin 
        unless user_signed_in? && 
           ((current_user.role? :admin) || (current_user.role? :cms_moderator))
          redirect_to admin_login_path, :flash => { :error => "Invalid role!" }
        end
      end
  end
end
