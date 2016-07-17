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

# data model for supplier with user
class Supplier < ActiveRecord::Base

  has_one :user

  validates :address, presence: true
  validates :bank_account_number, presence: true

end
