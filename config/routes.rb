Rails.application.routes.draw do

  #scope ":locale", :locale => /#{I18n.available_locales.join("|")}/ do 
    # Hide un-wanted routes
    devise_scope :user do
      get 'user/login' => redirect('/')
    end

    devise_for(
      :users, 
      { 
        :skip => [:registration],
        :controllers => { :sessions => 'devise/session' },
        :class_name => 'Core::User',
        :path => 'user',
        :path_names => { :sign_in => 'login', :sign_out => 'logout' }
      }
    )
    
    # Mount API
    mount API::Base => '/api' 

    namespace :admin do
      get '/' => 'core#index', :as => 'root'
      get '/login' => 'core#login', :as => 'login'
      get '/logout' => 'core#logout', :as => 'logout'
    end
      
    # Make sure this routeset is defined last
    #comfy_route :cms_admin, :path => '/admin/cms'
    comfy_route :cms, :path => '/', :sitemap => false
  #end

  #get '', :to => redirect("/#{I18n.default_locale}")
end
