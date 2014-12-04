class CustomAuthenticationFailure < Devise::FailureApp 
  protected 

  def redirect_url 
    admin_login_path
  end 

end 

