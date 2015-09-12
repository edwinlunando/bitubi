# == Schema Information
#
# Table name: wholesale_prices
#
#  id               :integer          not null, primary key
#  price_cents      :integer          default(0), not null
#  price_currency   :string(255)      default("USD"), not null
#  minimum_quantity :integer
#  active           :boolean
#  product_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class WholesalePriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
