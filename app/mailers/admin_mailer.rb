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

  def new_order(order)
    @order = order
    mail(to: more_admin, subject: 'Ada Pesanan Manual Baru! #' + @order.id.to_s)
  end

  private

  def admin
    'admin@larisni.com'
  end

  def finance
    'finance@larisni.com'
  end

  def more_admin
    'vendorpasutri@larisni.com'
  end

end
>>>>>>> 6e1e61f43112284fcec22c417d2096c0a3198620
