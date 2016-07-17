# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  slug              :string(255)
#  description       :text(65535)
#  price_dropship    :decimal(10, )
#  stock             :integer
#  unit              :string(255)
#  weight            :decimal(10, )
#  user_id           :integer
#  category_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  published         :boolean
#  recommended_price :decimal(10, )
#  priority          :integer
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:line_items) }
  it { should have_many(:product_images) }
  it { should have_many(:wholesale_prices) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:stock) }
  it { should validate_presence_of(:unit) }
  it { should validate_presence_of(:price_dropship) }
  it { should validate_presence_of(:category) }

  # looks like bug
  # it { should validate_length_of(:stock).is_at_least(1) }

end
