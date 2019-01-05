class Guest < ApplicationRecord

  # Assocition
  has_many :reservations
  has_many :restourants, through: :reservations
end
