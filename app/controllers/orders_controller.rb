class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @cart = Cart.find(session[:cart_id])
    Order.stripe_payment(@cart, params)
    @order = Order.create(cart_id: @cart.id)
    @cart.paid = true
    session.clear
    redirect_to order_path(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
    def order_params
      params.require(:order).permit(:movie_id)
    end
end
