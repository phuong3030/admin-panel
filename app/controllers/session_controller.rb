class SessionController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || account_url
  end
end
