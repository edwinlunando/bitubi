# == Schema Information
#
# Table name: suppliers
#
#  id                  :integer          not null, primary key
#  address             :string(255)
#  bank_account_number :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string(255)
#  image_file_name     :string(255)
#  image_content_type  :string(255)
#  image_file_size     :integer
#  image_updated_at    :datetime
#  description         :text(65535)
#

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
