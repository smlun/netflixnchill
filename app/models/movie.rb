class Movie < ApplicationRecord
  validates :title, :starring, :price, :description, presence: true
  validates :price, numericality: true
end
