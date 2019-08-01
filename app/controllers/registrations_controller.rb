class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_login, only: [:new, :create]

  protected

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def after_sign_up_path_for(resource)
    "/"
  end
end
