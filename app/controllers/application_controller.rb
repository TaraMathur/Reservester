class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
 # for paperclip:
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
 # do i need this for paperclip?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar) }
  end

end
