# frozen_string_literal: true

# class RegistrationsController
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_login, only: %i[new create]

  def update_resource(resource, params)
    if current_user.provider == 'facebook'
      params.delete('current_password')
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
      flash.now[:alert] = 'There was an error with the recaptcha
                          code below. Please re-enter the code.'
      flash.delete :recaptcha_error
      render :new
    end
  end

  def after_sign_up_path_for(*)
    '/'
  end
end
