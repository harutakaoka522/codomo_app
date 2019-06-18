class UsersController < ApplicationController
  before_action :login_check, only: [:show, :edit]
  before_action :correct_user, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(id: current_user.id)
    end
  end
end

