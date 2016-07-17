# == Schema Information
#
# Table name: line_items
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  quantity       :integer
#  order_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  state          :string(255)
#  receipt_number :string(255)
#

require 'rails_helper'

RSpec.describe LineItem, type: :model do

  it { should belong_to(:product) }
  it { should belong_to(:order) }

  it { should validate_presence_of(:product_id) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:order_id) }

end
