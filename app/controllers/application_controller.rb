class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception   
  # Catch all CanCan errors and alert the user of the exception. 
  rescue_from CanCan::AccessDenied do | exception |
    if request.env["HTTP_REFERER"]
      redirect_to :back, :alert => exception.message
      flash[:alert] = exception.message
    else
      redirect_to root_path
    end
  end
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
  end
  #Devise redirect after proper Log In:
  def after_sign_in_path_for(resource)
    home_home_path
  end
  #Devise for Rails 4's Strong Parameters code:
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
