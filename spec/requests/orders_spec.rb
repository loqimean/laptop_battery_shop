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

RSpec.describe 'OrdersController', type: :request do
  let!(:order) { create(:order) }
  let!(:product) { create(:product) }

  let(:valid_attributes) { { order: attributes_for(:order) } }
  let(:invalid_attributes) { { order: attributes_for(:order, :invalid_order) } }

  before { post add_product_in_cart_path(product) }

  describe 'GET #show' do
    it 'returns the order' do
      get order_path(order)

      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'sets products and initializes a new order' do
      get new_order_path

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid order params' do
      it 'creates a new order, and redirects to order page' do
        expect do
          post orders_path,
               params: { order: valid_attributes[:order] }
        end.to change(Order, :count).by(1)

        expect(response).to redirect_to(order_path(Order.last))
        expect(flash[:notice]).to eq('Order was successfully created.')

        expect(session[:products]).to be_nil
      end
    end

    context 'with invalid order params' do
      it 'renders the new template with unprocessable entity status' do
        expect do
          post orders_path,
               params: { order: invalid_attributes[:order] }
        end.not_to change(Order, :count)

        expect(response).to be_unprocessable
        expect(response).to render_template(:new)
      end
    end
  end
end
