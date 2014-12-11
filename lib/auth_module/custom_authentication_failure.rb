class CustomAuthenticationFailure < Devise::FailureApp 

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end

  def redirect_url 
    session[:previous_url] || root_path
  end 

end 

