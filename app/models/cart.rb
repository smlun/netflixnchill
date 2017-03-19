# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  paid       :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :line_items

  def calculate_total
    amount = 0.0
    line_items.each do |f|
      amount += (f.movie.price*f.quantity)
    end
    amount
  end

  def stack_to_cart(movie_id, quantity)
    # self.line_items.exists?(movie_id: movie_id)
    if item_exists_in_cart(movie_id)
      increase_quantity(movie_id, quantity)
    else
      add_line_item(movie_id, quantity)
    end
  end

private
  def item_exists_in_cart(movie_id)
    line_items.pluck(:movie_id).include?(movie_id)
  end

  def increase_quantity(movie_id, quantity)
    line_item = line_items.find_by(movie_id: movie_id)
    line_item.quantity += quantity
    line_item.save!
  end

  def add_line_item(movie_id, quantity)
    line_items.create(movie_id: movie_id, quantity: quantity)
  end

end
