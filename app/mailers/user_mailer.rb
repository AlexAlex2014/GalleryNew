class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com',
  default from: ENV.fetch('USERNAME')

  def welcome_email(user)
    @user = user
    mail(to: @user["email"], subject: 'Welcome to App gallery')
  end

  def sub_email(sub)
    @sub = sub
    @user = User.all.where("id = '#{@sub["user_id"]}'").first
    @categories = Category.all
    mail(to: @user.email, subject: 'You subscribed to the category')
  end

  def image_email(email)
    mail(to: email, subject: 'The image added to the category that you subscribed')
  end
end
