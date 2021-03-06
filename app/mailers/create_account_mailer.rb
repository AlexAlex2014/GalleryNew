# frozen_string_literal: true

# class CreateAccountMailer
class CreateAccountMailer < ApplicationMailer
  def create_account
    mail to: User.first.email,
         subject: 'Create account'
  end
end
