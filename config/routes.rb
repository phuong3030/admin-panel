Rails.application.routes.draw do

  #scope ":locale", :locale => /#{I18n.available_locales.join("|")}/ do 
    devise_for(
      :users, 
      { 
        :skip => [:registration],
        :controllers => { :sessions => 'session' },
        :class_name => 'Core::User',
        :path => '/admin',
        :path_names => {:sign_in => 'login', :sign_out => 'logout'}
      }
    )
      
    comfy_route :cms_admin, :path => '/admin/cms'

    # root for render page from CMS system
    root :to => "comfy/cms/content#show"

    # Make sure this routeset is defined last
    comfy_route :cms, :path => '/', :sitemap => false

  #end

  #get '', :to => redirect("/#{I18n.default_locale}")
end
