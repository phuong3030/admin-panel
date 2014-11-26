module FoodStore::AuthModule

  def authenticate
    if current_user
      ability = Core::Ability.new(current_user)
      return true if ability.can?(:manage, "Cms::Site")
      raise CanCan::AccessDenied
    else
      scope = Devise::Mapping.find_scope!(:user)
      session["#{scope}_return_to"] = new_user_session_path(:locale => I18n.locale) # if localized...
      redirect_to new_user_session_path
    end
  end

  def account_url
    return new_user_session_url unless user_signed_in?
    case current_user.class.name
    when "Customer"
      customer_root_url
    when "Supplier"
      supplier_root_url
    else
      ability = Core::Ability.new(current_user)
      if ability.can?(:manage, :all)
        admin_root_path
      elsif ability.can?(:manage, "Cms:Site")
        comfy_admin_cms_path
      else
        root_url
      end
    end if user_signed_in? 
  end

  def access_denied(exception)
    redirect_to admin_root_path, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, roles: []) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  #private

  #def set_locale
  #I18n.locale = params[:locale] if params[:locale].present?
  #end

  #def default_url_options(options = {})
  #{:locale => I18n.locale}
  #end
end
