class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_images
  accepts_nested_attributes_for :product_images
end
