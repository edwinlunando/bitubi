require 'rails_helper'

RSpec.describe Order, type: :model do

  it { should belong_to(:address) }
  it { should belong_to(:user) }
  it { should belong_to(:state_shipment_price) }
  it { should have_many(:line_items) }
  it { should have_many(:products) }
  it { should have_many(:suppliers) }

end
