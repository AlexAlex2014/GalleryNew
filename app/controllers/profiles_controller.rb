class ProfilesController < ApplicationController
  before_action :authorize_correct_user, :only => [:edit, :update]

  def edit
    @profile = User.find(params[:id]).profile
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated successfully"
      redirect_to newsfeed_path
    else
      flash[:error] = "Something happened"
      redirect_to edit_profile_path
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @category = Category.new
    @categories = @user.categories #.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to persons_profile_path
  end

  private

  def profile_params
    params.require(:profile).permit(:location, :gender, :birthday) # , :avatar
  end
end
