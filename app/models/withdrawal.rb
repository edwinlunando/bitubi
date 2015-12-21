class Withdrawal < ActiveRecord::Base

  belongs_to :user

  validates :amount, numericality: { greater_than_or_equal_to: 100_000 }
  validates :user, presence: true

  def approve
    unless approved
      self.approved = true
      user.credit += amount
      user.save
      save
      return true
    end
    false
  end

end
