# == Schema Information
#
# Table name: shipment_types
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  display_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ShipmentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
