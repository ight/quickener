class Reservation < ApplicationRecord
  # Associations
  belongs_to :shift
  belongs_to :table
  belongs_to :restourant
  belongs_to :guest

  # Validation
  validate :reservation_time_check
  validate :check_table_user

  RECENT_RECORDS_LIMIT = 20

  # Callback
  after_commit :notify_guest, :notify_restourant, on: [:create, :update]

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

  def notify_guest
    if created_at_changed?
      action = "reservation_created"
      ReservationGuestMailer.confirmation(action, self).deliver_now
    else
      action = "reservation_updated"
      ReservationGuestMailer.confirmation(action, self).deliver_now
    end
  end

  def notify_restourant
    if created_at_changed?
      action = "reservation_created"
      ReservationRestourantMailer.confirmation(action, self).deliver_now
    else
      action = "reservation_updated"
      ReservationRestourantMailer.confirmation(action, self).deliver_now
    end
  end
end
