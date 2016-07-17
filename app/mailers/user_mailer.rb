# send user based email
class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Selamat datang di Larisni')
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: 'Konfirmasi Pesanan')
  end

  # def top_up_confirmation(top_up)
  #   @top_up = top_up
  #   mail(to: @top_up.user.email, subject: 'Konfirmasi Top Up Saldo')
  # end

end
