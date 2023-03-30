class ApplicationController < ActionController::Base
  before_action :set_default_user

  def set_default_user
    return unless user_signed_in? && current_user.confirmed_at?

    default_url_options[:user_id] = current_user.id
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
