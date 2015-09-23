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

# wholesale price for products
class WholesalePrice < ActiveRecord::Base
  belongs_to :product

  scope :ordered, -> { order(minimum_quantity: :desc) }
  scope :cheapest, -> { order(price: :asc) }
  scope :by_quantity, -> (quantity) { where('(minimum_quantity <= ? AND maximum_quantity >= ?) OR (minimum_quantity <= ?)', quantity, quantity, quantity) }

  validates :minimum_quantity, presence: true
  validates :maximum_quantity, presence: true
  validates :price, presence: true

  def price_money
    ActionController::Base.helpers.number_to_currency(price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
  end
end
