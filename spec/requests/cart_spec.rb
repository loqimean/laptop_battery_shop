# spec/requests/cart_spec.rb
require 'rails_helper'

RSpec.describe "Cart", type: :request do
  let!(:product) { create(:product) }

  describe "GET /cart" do
    it "renders the empty cart page" do
      get cart_index_path

      expect(response).to be_successful
      expect(response.body).to include("Your cart is empty yet")
    end

    it "renders the cart page with product" do
      post add_product_in_cart_path(product)
      get cart_index_path

      expect(response).to be_successful
      expect(response.body).to include(CGI.escape_html(product.name))
    end
  end

  describe "POST #buy" do
    it "adds the product to the cart and redirects back to the previous page" do
      post add_product_in_cart_path(product),
           headers: { 'HTTP_REFERER' => products_path }

      expect(session.dig(:products, product.id.to_s)).to be_present
      expect(response).to redirect_to(products_path)
    end
  end

  describe "POST #change_amount" do
    let(:amount) { 5 }

    it "updates the product amount in the cart and redirects back to the previous page" do
      post update_amount_product_in_cart_path(product),
           params: { amount: },
           headers: { 'HTTP_REFERER' => cart_index_path }

      expect(session.dig(:products, product.id.to_s)).to eq(amount)
      expect(response).to redirect_to(cart_index_path)
    end
  end

  describe "POST #cancel_shipping" do
    it "removes the product from the cart and redirects back to the previous page" do
      post remove_product_in_cart_path(product),
           headers: { 'HTTP_REFERER' => cart_index_path }

      expect(session.dig(:products, product.id.to_s)).to be_nil
      expect(response).to redirect_to(cart_index_path)
    end
  end

  describe "DELETE /clean_cart" do
    it "clears the cart and redirects to the products page" do
      delete cart_path(1)

      expect(session[:products]).to be_nil
      expect(response).to redirect_to(products_path)
    end
  end
end
