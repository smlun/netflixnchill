class Cart < ApplicationRecord
  belongs_to :user
  has_many :orders

  def calculate_total
    amount = 0.0
    self.orders.each do |order|
      amount += order.movie.price
    end
    amount
  end

end
