class Reservation < ApplicationRecord
  # Associations
  belongs_to :shift
  belongs_to :table
  belongs_to :restourant
  belongs_to :guest

  # Validation
  validate :reservation_time_check
  validate :check_table_user

  # Instance method
  #
  # validates the reservation time
  # it sends a check request to shift
  #
  # return: add validation error to the instance on true.
  def reservation_time_check
    errors[:reservation_time] << _('errors.invalid_reservation_time') unless shift.valid_reservation_time?(reservation_time)
  end

  # Instance method
  #
  # validates the number of guest
  # it sends a check request to table
  #
  # return: add validation error to the instance on true.
  def check_table_user
    errors[:guest_count] << _('errors.invalid_user_number') unless table.valid_guest_count?(guest_count)
  end  
end
