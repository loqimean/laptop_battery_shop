class Cart::StorageService
  attr_reader :session, :params

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def realized_products
    Product.where(id: session[:products].keys)
  end

  def sum
    Product
      .where(id: session[:products].keys)
      .sum { |product| product.price * product_amount(product) }
  end

  def products_count
    return 0 if session[:products].blank?

    session[:products].count
  end

  def product_sum(product)
    product_amount(product) * product.price
  end

  def product_amount(product)
    session.dig(:products, product.id.to_s)
  end
end
