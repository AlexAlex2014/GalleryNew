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

  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

end
