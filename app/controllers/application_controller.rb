class ApplicationController < ActionController::Base
  before_action :set_user
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :username, :email, :password, :password_confirmation)
    end
  end

  def set_user
    cookies[:username] = current_user.username || 'guest' if current_user
  end

end
