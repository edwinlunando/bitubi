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
# data model for supplier with user
class Supplier < ActiveRecord::Base

  has_one :user

  has_attached_file :image, styles: {
    medium: '300x300>',
    thumb: '100x100>'
  }
  validates_attachment_content_type :image, content_type: %r{/\Aimage\/.*\Z/}

end
