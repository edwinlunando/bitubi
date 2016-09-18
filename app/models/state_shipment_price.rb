# == Schema Information
#
# Table name: state_shipment_prices
#
#  id               :integer          not null, primary key
#  state_id         :integer
#  shipment_type_id :integer
#  price            :decimal(10, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class StateShipmentPrice < ActiveRecord::Base

  belongs_to :state
  belongs_to :shipment_type

end
