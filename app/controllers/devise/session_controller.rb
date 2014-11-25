module Devise 
  class SessionController < Devise::SessionsController
    def after_sign_in_path_for(resource)
      account_url || stored_location_for(resource)
    end
  end
end
