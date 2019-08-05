class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_login, only: [:new, :create]
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  protected

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end
  end

  def after_sign_up_path_for(resource)
    "/"
  end
end
