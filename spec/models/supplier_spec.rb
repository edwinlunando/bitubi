# == Schema Information
#
# Table name: suppliers
#
#  id                  :integer          not null, primary key
#  address             :string(255)
#  bank_account_number :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
