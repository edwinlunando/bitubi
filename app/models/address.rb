# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# alamat
class Address < ActiveRecord::Base

  attr_accessor :province, :city, :shipment_type
  belongs_to :state

  validates :name, presence: true

end
