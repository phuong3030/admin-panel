class Admin::CoreController < Comfy::Admin::Cms::BaseController

  layout 'admin'

  skip_before_action :load_admin_site, :load_fixtures
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
