class Admin::CoreController < ApplicationController

  layout 'admin'

  before_action :authenticate, :except => [:login, :logout]

  # GET /admin
  def index
  end

  # GET /admin/login
  def login
    @user = Admin::User.new
  end

  # GET /admin/logout
  def logout
  end

end
