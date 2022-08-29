class Menu < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true

  validates :size, inclusion: { in: %w(Breakfast Lunch Dinner Starters Mains Desserts Drinks), message: "%{value} is not a valid category" }
end
