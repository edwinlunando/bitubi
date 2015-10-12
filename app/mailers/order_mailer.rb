# class to manage all order email
class OrderMailer < ApplicationMailer

  def confirmation(order, supplier)
    @order = order
    @supplier = supplier
    mail(to: @supplier.email, subject: 'Pesanan Baru!')
  end

end
