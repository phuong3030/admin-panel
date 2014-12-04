Rails.application.routes.draw do

  #scope ":locale", :locale => /#{I18n.available_locales.join("|")}/ do 
    # Hide un-wanted routes
    devise_scope :user do
      get 'user/login' => redirect('/admin/login')
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

    get '/admin' => 'admin/core#index', :as => 'admin_root'
    get '/admin/login' => 'admin/core#login', :as => 'admin_login'
      
    comfy_route :cms_admin, :path => '/admin/cms'

    # Root for render page from CMS system
    root :to => 'comfy/cms/content#show'

    # Make sure this routeset is defined last
    comfy_route :cms, :path => '/', :sitemap => false

  #end

  #get '', :to => redirect("/#{I18n.default_locale}")
end
