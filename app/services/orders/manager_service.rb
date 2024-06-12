class Orders::ManagerService
  attr_reader :order, :session

  def initialize(order, session)
    @order = order
    @session = session
  end

  def call
    create_relations
    substract_balance

    # clean cart
    session.delete(:products)
  end

  private

  def create_relations
    products_collection = Product.where(id: session[:products].keys)

    products = products_collection.map do |product|
      desired_amount = session.dig(:products, product.id.to_s)
      amount = [desired_amount, product.balance].min

      { product_id: product.id, amount: }
    end

    order.product_orders.insert_all(products)
  end

  def substract_balance
    order.products.each do |product|
      amount = order.product_orders.find_by(product_id: product.id).amount
      product.decrement!(:balance, amount)
    end
  end
end
