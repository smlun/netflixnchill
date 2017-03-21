require 'stripe'

class StripeService

  def self.stripe_payment(cart, params)
    stripe_token = params[:stripeToken]
    payment_type = params[:stripeTokenType]
    customer_email = params[:stripeEmail]
    Stripe.api_key = "sk_test_L3iQjnqaaxHzHVBzXsgLmR7e"
    Stripe::Charge.create(
    amount: (cart.calculate_total*100).to_i,
    currency: "usd",
    source: stripe_token
    )
  end

end
