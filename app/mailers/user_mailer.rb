# send user based email
class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Selamat datang di Larisni')
  end

end
