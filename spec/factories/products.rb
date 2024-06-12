# table products
#   name            string        null: false
#   description     text
#   price           decimal       null: false      default: 0.0      precision: 8, scale: 2
#   balance         integer       null: false      default: 0
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :name, presence: true
#   validates :price, :balance, numericality: { greater_than_or_equal_to: 0 }

#   has_many :product_orders, dependent: :destroy
#   has_many :orders, through: :product_orders

require 'faker'

FactoryBot.define do
  factory :product do
    name { Faker::Game.title }
    description { Faker::Lorem.paragraph(sentence_count: 60) }
    price { rand(15..99) }
    balance { rand(20..60) }
  end

  trait :invalid_product do
    name { nil }
    description { nil }
    price { -1 }
    balance { -999 }
  end
end
