# frozen_string_literal: true

# class ProfilesController
class ProfilesController < ApplicationController
  def edit
    @profile = User.find(params[:id]).profile
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Profile updated successfully'
      redirect_to newsfeed_path
    else
      flash[:error] = 'Something happened'
      redirect_to edit_profile_path
    end
  end

  def show
    @user = current_user
    @profile = @user.profile
    @category = Category.new
    @categories = @user.categories
  end

  private

  def profile_params
    params.require(:profile).permit(:location, :gender, :birthday)
  end
end
