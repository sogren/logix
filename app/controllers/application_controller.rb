class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up)        << :username
   devise_parameter_sanitizer.for(:account_update) << :username
  end

  def after_sign_in_path_for(resource)
    account_path
  end

  def after_sign_up_path_for(resource)
    account_path # Or :prefix_to_your_route
  end

  private

    def require_login(path = root_path)
      unless user_signed_in?
        flash[:danger] = 'You cannot do this! First sign in or sign up'
        redirect_to path
      end
    end

    def require_log_out(path = root_path)
      if user_signed_in?
        flash[:danger] = 'You are already logged in'
        redirect_to path
      end
    end
end
