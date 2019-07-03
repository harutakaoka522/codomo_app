class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :login_check, only: [:edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller? 
    
  def login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end
          
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    lash[:alert] = "ログインしました"
    user_path(id: current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました"
    root_path
  end
end
