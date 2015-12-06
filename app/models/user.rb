# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  last_name              :string(255)
#  role                   :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  phone_number           :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  credit                 :decimal(10, )    default(0)
#  supplier_id            :integer
#  active                 :boolean          default(TRUE)
#  verified               :boolean
#
# standard user class with devise
class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relation
  has_many :line_items, through: :orders
  has_many :products
  has_many :orders
  has_many :top_ups
  belongs_to :supplier
  accepts_nested_attributes_for :supplier

  # validation
  phony_normalize :phone_number, default_country_code: 'ID'
  validates :phone_number, phony_plausible: true
  enum role: { admin: 'admin', user: 'user', supplier: 'supplier' }

  # scope
  scope :supplier, -> { where(role: [:supplier]) }

  # callback
  before_save :default_values

  def default_values
    self.role ||= User.roles[:user]
    self.supplier ||= Supplier.new
  end

  def country_code
    'ID'
  end

  def last_order
    if orders.count == 0
      order = Order.new
      order.user = self
      order.save
      return order
    else
      if orders.last.done? || orders.last.delivery? || Order.last.failed?
        order = Order.new
        order.user = self
        order.save
        return order
      else
        return orders.last
      end
    end
  end

  def active_for_authentication?
    super && active
  end

  def inactive_message
    'Maaf, akun ini belum diaktivasi'
  end

  def name
    first_name.to_s + ' ' + last_name.to_s
  end

  def to_s
    email
  end

  def to_label
    email
  end

end
