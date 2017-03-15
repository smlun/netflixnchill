class Movie < ApplicationRecord
  has_many :orders

  validates :title, :starring, :price, :description, presence: true
  validates :price, numericality: true
end
