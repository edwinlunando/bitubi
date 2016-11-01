# == Schema Information
#
# Table name: addresses
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  state_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  receiver_name        :string(255)
#  receiver_phone       :string(255)
#  sender_name          :string(255)
#  sender_phone         :string(255)
#  zipcode              :string(255)
#  special_instructions :text(65535)
#

class Address < ActiveRecord::Base

  attr_accessor :province, :city, :courier, :shipment_type, :code
  belongs_to :state

  validates :name, presence: true

  def one_line
    if state.present?
      [name, state.name, state.city.name, state.city.province.name, zipcode].join(', ')
    else
      name
    end
  end

end
