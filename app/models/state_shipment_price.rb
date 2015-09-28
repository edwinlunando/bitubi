class StateShipmentPrice < ActiveRecord::Base
  belongs_to :state
  belongs_to :shipment_type
end
