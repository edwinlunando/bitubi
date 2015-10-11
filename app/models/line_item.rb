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

  enum purchase_type: [:dropship, :wholesale]

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :order_id
  validates_presence_of :purchase_type

  # State
  include AASM

  aasm column: :state do # default column: aasm_state
    state :confirm, initial: true
    state :delivery
    state :receive
    state :done
    state :failed

    event :confirm do
      transitions from: :confirm, to: :delivery
    end

    event :deliver do
      transitions from: :delivery, to: :receive
    end

    event :receive do
      transitions from: :receive, to: :done
    end

    event :cancel do
      transitions to: :failed
    end

  end

  def price_per_quantity
    if dropship?
      product.price_dropship
    else
      fail Errors::PriceNotFound if product.wholesale_prices.ordered.by_quantity(quantity).count == 0
      product.wholesale_prices.ordered.by_quantity(quantity).first.price
    end
  end

  def weight
    quantity * product.weight
  end

  def weight_kilograms
    weight / 1000.0
  end

  def weight_normalized
    weight_total = weight_kilograms
    return 1.0 if weight_total < 1.0

    if weight_total % 1 < 0.3
      weight_total.floor
    else
      weight_total.ceil
    end
  end

  def shipping_cost
    weight_normalized * order.state_shipment_price.price
  end

  def check_wholesale_price
    false if product.wholesale_prices.ordered.by_quantity(quantity).count == 0
    true
  end

  def price
    quantity * price_per_quantity
  end

end
