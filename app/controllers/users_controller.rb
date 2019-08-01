class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this

  # GET /users
  # GET /users.json
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



    # @category = Category.new
    # @user = current_user
    # @categories = @user.categories #get_newsfeed.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def notifications
    @user = current_user
    @notifications = @user.notifications
  end
  #
  # def friend_list
  #   @user = current_user
  #   @friends = current_user.get_friends
  # end
  #

  # # GET /users/1
  # # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "Profile updated successfully"
  #     redirect_to users_path
  #   else
  #     flash[:error] = "Something happened"
  #     redirect_to edit_profile_path
  #   end
  # end


  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :current_password)
  end

end
