module ApplicationHelper
  def applied_price(movie, user)
    user_signed_in? ? movie.price*0.85 : movie.price
  end
end
