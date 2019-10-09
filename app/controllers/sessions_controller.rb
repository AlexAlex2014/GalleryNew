class SessionsController < Devise::SessionsController
  prepend_after_action :after_login, only: [:create]
  before_action :before_logout, only: [:destroy]

  def create
    flash.clear
    user = User.find_by_email(sign_in_params['email'])

    super and return unless user

    adjust_failed_attempts user

    super and return if (user.failed_attempts <= User.logins_before_captcha)

    super and return if user.locked_at or verify_recaptcha


    # Don't increase failed attempts if Recaptcha was not passed
    decrement_failed_attempts(user) if recaptcha_present?(params) and
        !verify_recaptcha

    # Recaptcha was wrong
    self.resource = resource_class.new(sign_in_params)
    sign_out
    flash[:error] = 'Captcha was wrong, please try again.'
    respond_with_navigational(resource) { render :new }
  end


  private
  def adjust_failed_attempts(user)
    if user.failed_attempts > user.cached_failed_attempts
      user.update cached_failed_attempts: user.failed_attempts
    else
      increment_failed_attempts(user)
    end
  end

  def increment_failed_attempts(user)
    user.increment :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
  end

  def decrement_failed_attempts(user)
    user.decrement :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
  end

  def recaptcha_present?(params)
    params[:recaptcha_challenge_field]
  end

  def after_sign_in_path_for(resource)
    resource.update cached_failed_attempts: 0, failed_attempts: 0
    root_path
  end

  def after_login
    Action.new(:user_id=>current_user.id, :action=>'user_sign_in',
               :action_path=>request.original_url).save if user_signed_in?
  end

  def before_logout
    Action.new(:user_id=>current_user.id, :action=>'user_sign_out',
               :action_path=>request.original_url).save if user_signed_in?
  end
end