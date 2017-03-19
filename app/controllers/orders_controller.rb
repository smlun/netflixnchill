class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = Cart.find(session[:cart_id])
    stripe_token = params[:stripeToken]
    payment_type = params[:stripeTokenType]
    customer_email = params[:stripeEmail]
    Stripe.api_key = "sk_test_L3iQjnqaaxHzHVBzXsgLmR7e"
    Stripe::Charge.create(
    amount: (@cart.calculate_total*100).to_i,
    currency: "usd",
    source: stripe_token
    )
    # add cart id to the order
    # save the order
    @order = Order.create(cart_id: @cart)
    # clear the session
    session.clear
    # redirect to reciept page
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
