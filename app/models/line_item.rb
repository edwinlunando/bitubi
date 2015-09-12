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
end
