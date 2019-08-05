class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @user = current_user
    @category = Category.new
  end

  def newsfeed
    @categories = Category.all
    @user = current_user
    @subs = @user.subs
  end

  def notifications
    @user = current_user
    @notifications = @user.notifications
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :current_password)
  end
end
