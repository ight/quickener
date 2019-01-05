class Table < ApplicationRecord

  # Association
  belongs_to :restourant
  has_many :reservations
end