class Promotion < ActiveRecord::Base

  enum action_type: [:code]

  enum promotion_type: [:free_delivery]

  scope :active, -> { where(active: true) }

  def eligible?
    return true if usage < global_usage_limit
    false
  end

end
