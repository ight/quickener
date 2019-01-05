class Reservation < ApplicationRecord
  # Associations
  belongs_to :shift
  belongs_to :table
  belongs_to :restourant
  belongs_to :guest
end
