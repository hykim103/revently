class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  # validates :restaurant_id, uniqueness: { scope: :user_id }
  scope :ordered, -> { order(booking: :asc) }
end
