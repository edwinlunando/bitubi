# class to manage line item
class LineItemsController < ApplicationController

  before_action :authenticate_user!

  def approve
    @line_item = LineItem.find(params[:id])
    @line_item.confirmation
    @line_item.save
    LineItemMailer.approve(@line_item).deliver_now
    redirect_to sell_path, notice: 'Barang dikonfirmasi'
  end

  def cancel
    @line_item = LineItem.find(params[:id])
    @line_item.cancel
    @line_item.save
    LineItemMailer.cancel(@line_item).deliver_now
    redirect_to sell_path, notice: 'Barang dibatalkan'
  end

  def ship
    @line_item = LineItem.find(params[:id])
    @line_item.deliver
    @line_item.save
    LineItemMailer.ship(@line_item).deliver_now
    redirect_to sell_path, notice: 'Barang dikirim'
  end

end
