# mailer to address all line item email
class LineItemMailer < ApplicationMailer

  def approve(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Konfirmasi Barang')
  end

  def cancel(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Pembatalan Barang')
  end

  def ship(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Pengirman Barang')
  end

end
