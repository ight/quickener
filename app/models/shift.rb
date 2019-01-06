class Shift < ApplicationRecord

  # Association
  belongs_to :restourant
  has_many :reservations

  # Validation
  validate :start_end_time

  # Instance method
  #
  # validates the start and end date
  # it compare the start time and end time
  # set on the shift
  #
  # return: add validation error to the instance on true.
  def start_end_time
    errors[:start_time] << _('errors.invalid_shift_time') if start_time.to_i > end_time.to_i
  end 

  # Instance method
  #
  # validate the reservation time with respect
  # to shift time.
  #
  # return: true or false.
  def valid_reservation_time?(reservation_time)
    if start_time.to_i < reservation_time.to_i && reservation_time.to_i < end_time.to_i
      return true
    else
      return false
    end
  end
end
