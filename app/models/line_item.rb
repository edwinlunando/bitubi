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

class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  enum purchase_type: [:dropship, :grosir]

  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :order_id
  validates_presence_of :purchase_type

  def get_price_per_quantity
    if purchase_type == :dropship
      product.price_dropship
    else
      product.wholesale_prices.ordered.where("minimum_quantity <= ? AND minimum_quantity >= ?", quantity, quantity).first.price
    end
  end

  def get_price
    quantity * get_price_per_quantity
  end
end
