require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  # Test Association
  test 'reservation belongs_to shift' do
    assert_equal shifts(:morning), reservations(:prakash_reservation).shift
  end

  test 'reservation belongs_to table' do
    assert_equal tables(:bar_top), reservations(:prakash_reservation).table
  end

  test 'reservation belongs_to restourant' do
    assert_equal restourants(:bbq), reservations(:prakash_reservation).restourant
  end

  test 'reservations belongs_to guest' do
    assert_equal guests(:prakash_guest), reservations(:prakash_reservation).guest
  end

  # Test validation
  test 'save valid reservation' do
    reservation = new_reservation
    assert reservation.valid?
    reservation.save
    assert_equal 0, reservation.errors.count
  end

  test 'reservation_time_check on create' do
    reservation = new_reservation
    reservation.reservation_time = DateTime.now.beginning_of_day + 7.hours
    assert_not reservation.valid?
    reservation.save
    assert_equal 1, reservation.errors.count
    assert_equal "Invalid reservation time is provided", reservation.errors.messages[:reservation_time][0]
  end

  test 'reservation_time_check on update' do
    reservation = reservations(:prakash_reservation)
    reservation.reservation_time = DateTime.now.beginning_of_day + 7.hours
    assert_not reservation.valid?
    reservation.save
    assert_equal 1, reservation.errors.count
    assert_equal "Invalid reservation time is provided", reservation.errors.messages[:reservation_time][0]
  end

  test 'check_table_user on create' do
    reservation = new_reservation
    reservation.guest_count = 30
    assert_not reservation.valid?
    reservation.save
    assert_equal 1, reservation.errors.count
    assert_equal "Please check guest count, not in range for the table", reservation.errors.messages[:guest_count][0]
  end

  test 'rcheck_table_user on update' do
    reservation = reservations(:prakash_reservation)
    reservation.guest_count = 30
    assert_not reservation.valid?
    reservation.save
    assert_equal 1, reservation.errors.count
    assert_equal "Please check guest count, not in range for the table", reservation.errors.messages[:guest_count][0]
  end  

  private

  def new_reservation
    Reservation.new(guest_id: guests(:ready_guest).id,
      restourant_id: restourants(:odette).id,
      shift_id: shifts(:morning_odette).id,
      table_id: tables(:booths).id,
      guest_count: 7,
      reservation_time: DateTime.now.beginning_of_day + 9.hours)
  end
end
