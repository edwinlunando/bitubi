# == Schema Information
#
# Table name: top_ups
#
#  id         :integer          not null, primary key
#  amount     :decimal(10, )
#  name       :string(255)
#  bank       :string(255)
#  approved   :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uid        :decimal(10, )
#  transfer   :boolean
#

require 'rails_helper'

RSpec.describe TopUp, type: :model do

  it { should belong_to(:user) }

end
