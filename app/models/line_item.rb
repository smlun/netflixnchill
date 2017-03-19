# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  movie_id   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :movie
  belongs_to :cart

  # This disables duplicate line_items with the same movie in a single cart 'scope'
  validates_uniqueness_of :movie_id, scope: :cart_id

end
