class ApplicationController < ActionController::Base
  include FoodStore::AuthModule

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location
  
end
