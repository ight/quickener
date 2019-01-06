class Table < ApplicationRecord

  # Association
  belongs_to :restourant
  has_many :reservations

  # Validation
  validate :min_max_guest_count

  # Instance method
  #
  # validates the minimum and maximum guest count
  #
  # return: add validation error to the instance on true.
  def min_max_guest_count
    errors[:min_num] << _('errors.invalid_guest_count') unless  min_num < max_num
  end

  # Instance method
  #
  # validate the guest count with respect
  # to table guest values.
  #
  # return: true or false.
  def valid_guest_count?(guest_count)
    if min_num <= guest_count && max_num >= guest_count
      return true
    else
      return false
    end
  end
end