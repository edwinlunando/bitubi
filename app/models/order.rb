class Order < ActiveRecord::Base
  has_many :line_items
  accepts_nested_attributes_for :line_items
  has_many :products , through: :line_items
  belongs_to :address
  belongs_to :user

  # State
  include AASM

  def self.states
    [:cart, :address, :payment, :confirm, :delivery, :done]
  end

  aasm column: :state do # default column: aasm_state
    state :cart, :initial => true
    state :address
    state :payment
    state :confirm
    state :delivery
    state :done

    event :checkout do
      transitions :from => :cart, :to => :address
    end

    event :addressing do
      transitions :from => :address, :to => :payment
    end

    event :pay do
      transitions :from => :payment, :to => :confirm
    end

    event :confirming do
      transitions :from => :confirm, :to => :delivery
    end

    event :finish do
      transitions :to => :done
    end
  end
end
