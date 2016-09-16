# class to manage all admin email
class AdminMailer < ApplicationMailer

  def receipt(order)
    @order = order
    mail(to: admin, subject: 'Ada Pesanan Yang Telah Dikirim! #' + @order.id.to_s)
  end

  def top_up(top_up)
    @top_up = top_up
    mail(to: admin, subject: 'Ada Top Up baru!')
  end

  def withdrawal(withdrawal)
    @withdrawal = withdrawal
    mail(to: finance, subject: 'Ada Penarikan baru!')
  end

  private

  def admin
    'admin@larisni.com'
  end

  def finance
    'finance@larisni.com'
  end

end
