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

class Withdrawal < ActiveRecord::Base

  belongs_to :user

  validates :amount, numericality: { greater_than_or_equal_to: 50_000 }
  validates :user, presence: true

  def approve
    if approved.nil? && user.credit >= amount
      self.approved = true
      user.credit -= amount
      user.save
      save
      return true
    end
    false
  end

  def decline
    if approved.nil?
      self.approve = false
      save
      return true
    end
    false
  end

end
