# == Schema Information
#
# Table name: provinces
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  raja_ongkir_id :integer
#

class Province < ActiveRecord::Base

end
