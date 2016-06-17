class Adjustment < ActiveRecord::Base
  belongs_to :order
  belongs_to :source, polymorphic: true
end
