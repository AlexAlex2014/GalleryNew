class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :require_login
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  prepend_after_action :after_login, only: [:facebook]

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

  def after_login
    Action.new(:user_id=>current_user.id, :action=>'user_sign_in',
               :action_path=>request.original_url).save if user_signed_in?
  end

end