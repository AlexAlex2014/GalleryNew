class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_login, only: [:new, :create]
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def create
    if verify_recaptcha
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      flash.delete :recaptcha_error
      render :new
    end
    # CreateAccountMailer.create_account.deliver_later
  end

  def after_sign_up_path_for(resource)
    "/"
  end
end
