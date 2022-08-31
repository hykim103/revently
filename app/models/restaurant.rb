class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :reservations, through: :users

  validates :name, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
  validates :phone_number, presence: true
  validates :venue_type, presence: true
  validates :chairs, presence: true
  validates :max_guests, presence: true
  # validates :phone_number, format: { with: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/,
  #   message: "only allows valid phone numbers" }
end
