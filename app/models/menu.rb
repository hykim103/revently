class Menu < ApplicationRecord
  has_one_attached :photo
  belongs_to :restaurant

  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true

  validates :category, inclusion: { in: %w(Breakfast Lunch Dinner Starters Mains Desserts Drinks), message: "%{value} is not a valid category" }
end
