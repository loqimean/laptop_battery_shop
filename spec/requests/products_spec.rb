# table products
#   name            string        null: false
#   description     text          null: false
#   price           decimal       null: false      precision: 8, scale: 2
#   balance         integer       null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :name, :description, presence: true
#   validates :price, :balance, numericality: { greater_than_or_equal_to: 0 }

#   resources :products

require "rails_helper"

RSpec.describe "/products", type: :request do
  let!(:product) { create(:product) }

  describe "GET #index" do
    it "renders a successful response" do
      get products_path

      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      get product_path(product)

      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end
end
