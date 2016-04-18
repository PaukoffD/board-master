class PffMailer < ApplicationMailer
	default from: 'xulia@paukoff.ru'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://fleamarket.paukoff.ru/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
