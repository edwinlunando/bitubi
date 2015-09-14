# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  slug           :string(255)
#  description    :text(65535)
#  price_dropship :decimal(10, )
#  stock          :integer
#  unit           :string(255)
#  weight         :decimal(10, )
#  user_id        :integer
#  category_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
