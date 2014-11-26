module Admin
  class CoreController < ApplicationController

    layout 'admin'

    before_action :authenticate_user!

    # GET /admin
    def index
    end

  end
end
