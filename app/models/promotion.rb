class Promotion < ActiveRecord::Base

  enum action_type: [:code]

  enum promotion_type: [:free_delivery, :cashback]

  scope :active, -> { where(active: true) }

  def eligible?(user)
    if usage < global_usage_limit && !user.cashback_promotion_limit
      return true
    end
    false
  end

end
