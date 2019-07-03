class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
    #protect_from_forgery with: :exception
    before_action :login_check, only: [:edit, :update, :destroy]
    
    
    def login_check
      unless user_signed_in?
        redirect_to root_path
      end
    end

    # ログイン済ユーザーのみにアクセスを許可する
   # before_action :authenticate_user!
  
    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        flash[:alert] = "ログインしました"
        user_path(id: current_user.id)
    end

    def after_sign_out_path_for(resource)
        flash[:alert] = "ログアウトしました"
        root_path
    end
end
