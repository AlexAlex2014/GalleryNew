# frozen_string_literal: true

# class CallbacksController
class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :require_login
  prepend_after_action :after_login, only: [:facebook]

  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:success] = 'Success'
      sign_in_and_redirect @user
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def after_login
    return unless user_signed_in?

    Action.new(user_id: current_user.id,
               action: 'user_sign_in',
               action_path: request.original_url).save
  end
end
