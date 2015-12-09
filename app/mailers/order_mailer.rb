# class to manage all order email
class OrderMailer < ApplicationMailer

  def confirmation(order, supplier)
    @order = order
    @supplier = supplier
    mail(to: @supplier.email, subject: 'Pesanan Baru!')
  end

  def receipt(order)
    @order = order
    mail(to: @order.user.email, subject: 'Pesanan Kamu Telah Dikirim!')
  end

  def cancel(order)
    @order = order
    mail(to: @order.user.email, subject: 'Pesanan Kamu Dibatalkan!')
  end

end
