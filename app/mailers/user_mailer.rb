class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email(user)
    p "////////////////////////////////", user.email, "////////////////////////////////"
    @user = user
    p "////////////////////////////////", @user, "////////////////////////////////"
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Vagabond!')
  end

end
