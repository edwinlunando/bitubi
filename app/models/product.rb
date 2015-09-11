class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_images
  has_many :wholesale_prices
  accepts_nested_attributes_for :product_images
  accepts_nested_attributes_for :wholesale_prices
end
