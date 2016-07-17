# == Schema Information
#
# Table name: withdrawals
#
#  id         :integer          not null, primary key
#  amount     :decimal(10, )
#  user_id    :integer
#  approved   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Withdrawal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
