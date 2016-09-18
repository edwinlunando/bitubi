# == Schema Information
#
# Table name: orders
#
#  id                      :integer          not null, primary key
#  total                   :decimal(10, )
#  special_instruction     :text(65535)
#  state                   :string(255)
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  address_id              :integer
#  state_shipment_price_id :integer
#  payment_time            :datetime
#  receipt_number          :string(255)
#  transfer_time           :datetime
#  transferred             :boolean
#  cancel_time             :datetime
#  shipment_price_value    :decimal(10, )
#  shipment_price_code     :string(255)
#  shipment_price_courier  :string(255)
#  shipment_price_name     :string(255)
#  shipment_price_etd      :string(255)
#

require 'rails_helper'

RSpec.describe Order, type: :model do

  it { should belong_to(:address) }
  it { should belong_to(:user) }
  it { should belong_to(:state_shipment_price) }
  it { should have_many(:line_items) }
  it { should have_many(:products) }
  it { should have_many(:suppliers) }

end
