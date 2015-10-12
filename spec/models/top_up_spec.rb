require 'rails_helper'

RSpec.describe TopUp, type: :model do

  it { should belong_to(:user) }

end
