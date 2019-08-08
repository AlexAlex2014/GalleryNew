class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :require_login
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:success] = "Success"
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end