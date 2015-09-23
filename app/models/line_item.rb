# == Schema Information
#
# Table name: line_items
#
#  id            :integer          not null, primary key
#  product_id    :integer
#  quantity      :integer
#  order_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  purchase_type :integer
#

# model to represent an item in an order/cart
class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  enum purchase_type: [:dropship, :grosir]

  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :order_id
  validates_presence_of :purchase_type

  def price_per_quantity
    if purchase_type == :dropship
      product.price_dropship
    else
      fail Errors::PriceNotFound if product.wholesale_prices.ordered.by_quantity(quantity).count == 0
      product.wholesale_prices.ordered.by_quantity(quantity).first.price
    end
  end

  def check_wholesale_price
    false if product.wholesale_prices.ordered.by_quantity(quantity).count == 0
    true
  end

  def price
    quantity * price_per_quantity
  end

  def wholesale?
    purchase_type == 'grosir'
  end
end
