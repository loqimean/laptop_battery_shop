# table product_orders
#   product_id      bigint        null: false
#   order_id        bigint        null: false
#   amount          integer       null: false       default: 1
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :amount, numericality: { greater_than: 0 }

#   belongs_to :product
#   belongs_to :order

require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  describe "validations" do
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end
end
