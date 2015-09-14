# == Schema Information
#
# Table name: products
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  slug                    :string(255)
#  description             :text(65535)
#  price_dropship_cents    :integer          default(0), not null
#  price_dropship_currency :string(255)      default("USD"), not null
#  stock                   :integer
#  unit                    :string(255)
#  weight                  :decimal(10, )
#  user_id                 :integer
#  category_id             :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Product < ActiveRecord::Base
  extend FriendlyId

  # Relation
  belongs_to :user
  belongs_to :category
  has_many :product_images
  has_many :wholesale_prices
  accepts_nested_attributes_for :product_images, allow_destroy: true
  accepts_nested_attributes_for :wholesale_prices

  friendly_id :name, use: :slugged

  def get_first_image
    product_images.try(:first)
  end

  def price_dropship_money
    ActionController::Base.helpers.number_to_currency(price_dropship, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
  end

end
