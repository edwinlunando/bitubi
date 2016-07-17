# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  slug              :string(255)
#  description       :text(65535)
#  price_dropship    :decimal(10, )
#  stock             :integer
#  unit              :string(255)
#  weight            :decimal(10, )
#  user_id           :integer
#  category_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  published         :boolean
#  recommended_price :decimal(10, )
#  priority          :integer
#

class Product < ActiveRecord::Base

  audited

  extend FriendlyId

  # Relation
  belongs_to :user
  belongs_to :category
  has_many :line_items, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :wholesale_prices, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :wholesale_prices, allow_destroy: true, reject_if: :all_blank

  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :weight, presence: true
  validates :stock, presence: true
  validates :unit, presence: true
  validates :price_dropship, presence: true
  validates :category, presence: true
  validates :wholesale_prices, length: { minimum: 1 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }

  alias_attribute :supplier, :user

  # scope
  scope :published, -> { joins(:user).where(published: true).where('users.active = ?', true) }
  scope :prioritize, -> { order(priority: :desc) }

  def get_first_image
    product_images.try(:first)
  end

  def price_dropship_money
    ActionController::Base.helpers.number_to_currency(price_dropship, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
  end

  def price_wholesale_minimum
    return nil if wholesale_prices.count == 0
    wholesale_prices.cheapest.first
  end

end
