# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  starring    :string
#  price       :float
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stock       :integer
#

class Movie < ApplicationRecord
  validates :title, :starring, :price, :description, presence: true
  validates :price, numericality: true
end
