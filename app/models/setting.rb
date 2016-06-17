# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  var        :string(255)      not null
#  value      :text(65535)
#  thing_id   :integer
#  thing_type :string(30)
#  created_at :datetime
#  updated_at :datetime
#

class Setting < RailsSettings::CachedSettings

  defaults[:confirmation_amount] = 1000000
  defaults[:account_number] = ''

end
