class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  # helper_method :current_user
  # def current_user
  #   if session[:user_id]
  #     User.find session[:user_id]
  #   else
  #     return nil
  #   end
  # end

  def authenticate
    if current_user == nil
      redirect_to login_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at)}
  end

end
