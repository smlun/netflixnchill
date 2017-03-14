class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @order = Order.new(movie_id: params[:movie_id])
    stripe_token = params[:stripeToken]
    payment_type = params[:stripeTokenType]
    customer_email = params[:stripeEmail]
    Stripe.api_key = "sk_test_L3iQjnqaaxHzHVBzXsgLmR7e"
    Stripe::Charge.create(
    amount: (@movie.price*100).to_i,
    currency: "usd",
    source: stripe_token
    )

    @order.save
    #send email
    redirect_to @movie, notice: 'Your order has been placed!'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
    def order_params
      params.require(:order).permit(:movie_id)
    end
end
