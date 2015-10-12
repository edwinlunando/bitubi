require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:products) }
  it { should have_many(:orders) }
  it { should have_many(:top_ups) }

end
