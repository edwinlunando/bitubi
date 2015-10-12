# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# category class the has many products
class Category < ActiveRecord::Base

  has_many :products
  validates_presence_of :name
  has_attached_file :image, styles: { thumb: '40x40>' }

end
