class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destory
  has_many :reservations, through: :users

  validates :name, :address, :cuisine, phone_number:, presence: true
  validates :phone_number, format: { with: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/,
    message: "only allows valid phone numbers" }
end
