class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?


  def current_user
    @user = User.find_by(id: 1)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end
