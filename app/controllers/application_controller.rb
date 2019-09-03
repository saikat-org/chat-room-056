class ApplicationController < ActionController::Base
  helper_method :emojify
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private
  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
