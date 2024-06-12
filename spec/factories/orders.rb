# table orders
#   first_name      string        null: false
#   last_name       string        null: false
#   address         string        null: false
#   phone           string        null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :first_name, :last_name, :address, :phone, presence: true

#   has_many :product_orders, dependent: :destroy
#   has_many :products, through: :product_orders

FactoryBot.define do
  factory :order do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
  end

  trait :invalid_order do
    first_name { nil }
    last_name { nil }
    address { nil }
    phone { nil }
  end
end
