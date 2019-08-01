class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @user = current_user
    @category = Category.new
  end

  def newsfeed
    @categories = Category.all
    # @category = Category.new
    @user = current_user
    @subs = @user.subs
    # @category_subs = {}
    # @subs.each do |sub|
    #   @category_subs = @categories.where("id = '#{sub.subable_id}'") # if sub.size > 0
    # end
    # Sub.includes(:category).where(categories: {id: 'sub.subable_id'})
    # @category = Category.new
    # @user = current_user
    # @categories = @user.categories #get_newsfeed.paginate(page: params[:page], per_page: 5).order('created_at DESC')
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
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :current_password)
  end
end
