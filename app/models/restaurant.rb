class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  validates :name, :address, :cuisine, phone_number:, presence: true
  validates :phone_number, format: { with: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/,
    message: "only allows valid phone numbers" }
end
