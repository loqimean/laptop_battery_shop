class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :orders, foreign_key: :customer_id, dependent: :nullify

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :password, presence: true,
                       length: { within: 8..128 },
                       on: :create

  def full_name
    "#{first_name} #{last_name}"
  end
end
