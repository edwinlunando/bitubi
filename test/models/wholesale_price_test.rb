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
#  maximum_quantity :integer
#

require 'test_helper'

class WholesalePriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
