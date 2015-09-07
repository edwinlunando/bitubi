class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  phony_normalize :phone_number, :default_country_code => 'ID'
  validates :phone_number, phony_plausible: true, presence: true

  def self.roles
    [
      ['Admin', 'admin'],
      ['User', 'user'],
      ['Supplier', 'supplier']
    ]
  end

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

end
