# frozen_string_literal: true

# class UserMailer
class UserMailer < ApplicationMailer
  default from: ENV.fetch('USERNAME_MAIL')

  def welcome_email(user)
    @user = user
    mail(to: @user['email'], subject: 'Welcome to App gallery')
  end

  def sub_email(sub)
    @sub = sub
    @user = User.all.where("id = '#{@sub['user_id']}'").first
    @categories = Category.all
    mail(to: @user.email, subject: 'You subscribed to the category')
  end

  def image_email(arr)
    @image = arr[1]
    @category_sub = arr[2]
    mail(to: arr[0], subject: 'New image added')
  end
end
