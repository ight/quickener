class Shift < ApplicationRecord

  # Association
  belongs_to :restourant
  has_many :reservations
end
