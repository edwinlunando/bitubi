# == Schema Information
#
# Table name: wholesale_prices
#
#  id               :integer          not null, primary key
#  price            :decimal(10, )
#  minimum_quantity :integer
#  active           :boolean
#  product_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class WholesalePrice < ActiveRecord::Base
  belongs_to :product

  def price_money
    ActionController::Base.helpers.number_to_currency(price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
  end
end
