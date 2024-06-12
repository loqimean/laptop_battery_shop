class Cart::ManagerService
  attr_reader :session, :params

  def initialize(session, params)
    @session = session
    @params = params
  end

  def call
    return if session[:products].nil?

    service = "Cart::#{params[:action_type].to_s.camelize}Service".constantize
    product = get_product

    service.call(session, product)
  end

  private

  def get_product
    product = Product.find(params[:id])

    return if product.nil?

    # set value if form send invalid data
    params[:amount] = 1 if params[:amount].blank?

    # set product if amount greater than balance
    params[:amount] = product.balance if product.balance < params[:amount].to_i

    {
      id: params[:id],
      amount: params[:amount].to_i,
      balance: product.balance
    }
  end
end
