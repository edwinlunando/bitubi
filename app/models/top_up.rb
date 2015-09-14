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
#

class TopUp < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :amount, :bank

  def approve
    if !self.approved
      self.approved = true
      self.save
      self.user.credit += self.amount
      self.user.save
      return true
    else
      return false
    end
  end
end
