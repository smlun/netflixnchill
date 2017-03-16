class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
    @total = @cart.calculate_total
  end

  def new
    @cart = Cart.new
  end

  def create
    @user = current_user
    @cart = Cart.new(user_id: @user.id)


    @order.save
    #send email
    redirect_to @movie, notice: 'Your order has been placed!'
  end

  def update
    @user = current_user
    @cart = Cart.find_by(user_id: current_user.id)
    stripe_token = params[:stripeToken]
    payment_type = params[:stripeTokenType]
    customer_email = params[:stripeEmail]
    Stripe.api_key = "sk_test_L3iQjnqaaxHzHVBzXsgLmR7e"
    Stripe::Charge.create(
    amount: @cart.calculate_total,
    currency: "usd",
    source: stripe_token
    )
    @cart.paid = true
    redirect_to movies_path, notice: 'Your payment has succeeded!'
  end
end
