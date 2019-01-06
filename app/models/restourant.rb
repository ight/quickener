class Restourant < ApplicationRecord

  # Association
  has_many :reservations
  has_many :shifts
  has_many :tables
  has_many :guests, through: :reservations

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "not properly formated" }
  validates :phone, phone: { possible: true, allow_blank: false, types: [:voip, :mobile], countries: [:in, :ca] }
end
