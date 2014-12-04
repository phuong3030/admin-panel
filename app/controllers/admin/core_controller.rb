module Admin
  class CoreController < ApplicationController

    layout 'admin'

    before_action :authenticate_user!, :except => [:login]

    # GET /admin
    def index
    end

    # GET /admin/login
    def login
    end
  end
end
