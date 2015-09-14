# == Schema Information
#
# Table name: product_images
#
#  id                :integer          not null, primary key
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#  product_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ProductImage < ActiveRecord::Base
  has_attached_file :data, styles: { medium: "300x300>", thumb: "100x100>", display: '320x200>', large: '800x300>' }
  validates_attachment_content_type :data, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :data

  belongs_to :product
end
