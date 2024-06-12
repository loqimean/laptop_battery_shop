class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :check_cart, only: :new

  def index
    @orders = current_user.orders
  end

  def show
    @order = resourse
  end

  def new
    @cart = Cart::StorageService.new(session, params)
    @order = Order.new
  end

  def create
    @cart = Cart::StorageService.new(session, params)
    @order = Order.new(order_params)

    if params[:promocode].present?
      promo = Promocode.find_by(code: params[:promocode])
      @order.promocode = promo if promo.present?
    end

    if @order.save
      Orders::ManagerService.new(@order, session).call

      redirect_to order_path(@order), notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def collection
    Order.ordered
  end

  def resourse
    collection.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :phone, :customer_id)
  end

  def check_cart
    redirect_to root_path, alert: "Your cart is empty yet" if session[:products].blank?
  end
end
