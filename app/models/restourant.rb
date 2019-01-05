class Restourant < ApplicationRecord

  # Association
  has_many :reservations
  has_many :shifts
  has_many :tables
  has_many :guests, through: :reservations
end
