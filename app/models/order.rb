# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  total               :decimal(10, )
#  special_instruction :text(65535)
#  state               :string(255)
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  address_id          :integer
#

# model to represent a User order
class Order < ActiveRecord::Base
  # Relation
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items
  has_many :products, through: :line_items
  belongs_to :address
  belongs_to :user
  belongs_to :state_shipment_price

  # Method
  def finish_order
    line_items.each do |line_item|
      line_item.product.stock -= line_item.quantity
      line_item.product.save
    end
  end

  # State
  include AASM

  def self.states
    [:cart, :address, :payment, :confirm, :delivery, :done]
  end

  aasm column: :state do # default column: aasm_state
    state :cart, initial: true
    state :address
    state :payment
    state :confirm
    state :delivery
    state :done

    event :checkout do
      transitions from: :cart, to: :address
    end

    event :addressing do
      transitions from: :address, to: :payment
    end

    event :pay do
      transitions from: :payment, to: :confirm
    end

    event :confirming do
      transitions from: :confirm, to: :delivery
    end

    event :finish do
      before do
        finish_order
      end
      transitions to: :done
    end
  end

  def total_without_shipment
    line_items.inject(0) { |result, element| result + element.price }
  end

  def total
    total_without_shipment + shipment_price
  end

  def total_weight
    return nil if state_shipment_price.nil?
    total_weight = line_items.inject(0) { |result, element| result + (element.quantity * element.product.weight) } / 1000.0
  end

  def display_weight
    weight = total_weight
    if weight % 1 < 0.3
      weight.floor
    else
      weight.ceil
    end
    weight
  end

  def shipment_price
    return 0 if state_shipment_price.nil?
    weight = display_weight
    weight * state_shipment_price.price
  end
end
