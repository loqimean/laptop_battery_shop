# table users
#    email                     string              null: false
#    encrypted_password        string              null: false
#    first_name                string              null: false
#    last_name                 string              null: false
#    address                   string
#    phone                     string
#    reset_password_token      datetime
#    reset_password_sent_at    datetime
#    remember_created_at       datetime
#    created_at                datetime            null: false
#    updated_at                datetime            null: false
#
#    has_many :orders, foreign_key: :customer_id

#    validates :first_name, :last_name, presence: true
#    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
#    validates :password, :presence => true,
#                         :length => {:within => 8..128},
#                         :on => :create

require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'verystrongpassword' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
    confirmed_at { Time.now }
  end

  trait :invalid_user do
    email { nil }
    password { 'qwerty' }
    first_name { nil }
    last_name { nil }
  end
end
