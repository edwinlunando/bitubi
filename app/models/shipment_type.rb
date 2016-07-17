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

# model shipment type like JNE OKE, REGULER
class ShipmentType < ActiveRecord::Base
  has_many :state_shipment_prices
  has_many :state, through: :state_shipment_prices
end
