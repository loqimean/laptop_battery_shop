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

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_numericality_of(:balance) }

    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:orders).through(:product_orders) }
    it { is_expected.to have_many(:product_orders).dependent(:destroy) }
  end
end
