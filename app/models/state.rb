# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base

  belongs_to :city
  has_many :state_shipment_prices
  has_many :shipment_types, through: :state_shipment_prices

  default_scope { order(:name) }

end
