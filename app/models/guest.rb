class Guest < ApplicationRecord

  # Assocition
  has_many :reservations
  has_many :restourants, through: :reservations

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "not properly formated" }
end
