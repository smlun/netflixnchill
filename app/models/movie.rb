class Movie < ApplicationRecord
  has_many :orders

  validates :title, presence: true
  validates :starring, presence: true
  validates :price, presence: true
  validates :description, presence: true 
end
