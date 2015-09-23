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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
