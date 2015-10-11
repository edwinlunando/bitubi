# mailer to address all line item email
class LineItemMailer < ApplicationMailer

  def approved(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Konfirmasi Barang')
  end

  def cancelled(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Pembatalan Barang')
  end

  def shipped(line_item)
    @line_item = line_item
    mail(to: @line_item.order.user.email, subject: 'Pengirman Barang')
  end

end
