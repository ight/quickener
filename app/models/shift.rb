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
    reservation_h = reservation_time.strftime("%H").to_i
    start_h = start_time.strftime("%H").to_i
    end_h = end_time.strftime("%H").to_i
    if start_h < reservation_h && reservation_h < end_h
      return true
    else
      return false
    end
  end
end
