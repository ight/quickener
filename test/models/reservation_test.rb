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
end
