# frozen_string_literal: true

# class UsersController
class UsersController < ApplicationController
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

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,
                                 :encrypted_password, :reset_password_token,
                                 :reset_password_sent_at, :remember_created_at,
                                 :confirmation_token, :failed_attempts,
                                 :cached_failed_attempts, :unconfirmed_email)
  end
end
