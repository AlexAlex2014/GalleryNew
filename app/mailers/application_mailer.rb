# frozen_string_literal: true

# class ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: '<from@example.com>',
          template_path: 'devise/mailer'
  layout 'mailer'
end
