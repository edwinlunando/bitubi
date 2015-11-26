# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  active             :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# category class the has many products
class Category < ActiveRecord::Base

  has_many :products
  validates_presence_of :name
  has_attached_file :image, styles: { thumb: '40x40>' }
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/gif', 'image/png']

end
