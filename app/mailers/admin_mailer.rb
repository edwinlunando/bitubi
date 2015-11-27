# class to manage all admin email
class AdminMailer < ApplicationMailer

  def receipt(order)
    @order = order
    mail(to: admin, subject: 'Ada Pesanan Yang Telah Dikirim! #' + @order.id)
  end

  def top_up(top_up)
    @top_up = top_up
    mail(to: admin, subject: 'Ada Top Up baru!')
  end

  private

  def admin
    'admin@larisni.com'
  end

end
