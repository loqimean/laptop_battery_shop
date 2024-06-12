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

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:products).through(:product_orders) }
    it { is_expected.to have_many(:product_orders).dependent(:destroy) }
  end
end
