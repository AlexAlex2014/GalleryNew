# frozen_string_literal: true

# class SessionsController
class SessionsController < Devise::SessionsController
  prepend_after_action :after_login, only: [:create]
  before_action :before_logout, only: [:destroy]

  def create
    flash.clear
    failed_attempts
    super && return if user_failed_attempts?
    super && return if user_locked_at?
    decrement_failed_attempts(user).recaptcha_valid?
    self.resource = resource_class.new(sign_in_params)
    recaptcha_wrong
  end

  private

  def user
    User.find_by_email(sign_in_params['email'])
  end

  def failed_attempts
    super && return unless user
    adjust_failed_attempts user
  end

  def user_failed_attempts?
    user.failed_attempts <= User.logins_before_captcha
  end

  def user_locked_at?
    user.locked_at || verify_recaptcha
  end

  def recaptcha_valid?
    recaptcha_present?(params) && !verify_recaptcha
  end

  def recaptcha_wrong
    sign_out
    flash[:error] = 'Captcha was wrong, please try again.'
    respond_with_navigational(resource) { render :new }
  end

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
    return unless user_signed_in?

    Action.new(user_id: current_user.id,
               action: 'user_sign_in',
               action_path: request.original_url).save
  end

  def before_logout
    return unless user_signed_in?

    Action.new(user_id: current_user.id,
               action: 'user_sign_out',
               action_path: request.original_url).save
  end
end
