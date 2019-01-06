require 'test_helper'

class ShiftTest < ActiveSupport::TestCase

  # Test Association
  test 'shift belongs_to restourant' do
    assert_equal restourants(:bbq), shifts(:morning).restourant
  end

  test 'shift has_many reservations' do
    assert shifts(:morning).reservations.exists?
  end

  # Test Validations

  test 'save valid shift' do
    shift = new_shift
    assert shift.valid?
    shift.save
    assert_equal 0, shift.errors.count
  end

  test 'start_end_time on create' do
    shift = new_shift
    shift.start_time = DateTime.now.beginning_of_day + 17.hours
    assert_not shift.valid?
    shift.save
    assert_equal 1, shift.errors.count
    assert_equal "Shift start time can not be greater than end time.", shift.errors.messages[:start_time][0]
  end

  test 'start_end_time on update' do
    shift = shifts(:morning)
    shift.start_time = DateTime.now.beginning_of_day + 17.hours
    assert_not shift.valid?
    shift.save
    assert_equal 1, shift.errors.count
    assert_equal "Shift start time can not be greater than end time.", shift.errors.messages[:start_time][0]
  end

  private

  def new_shift
    Shift.new(shift_type: "noon", start_time: DateTime.now.beginning_of_day + 12.hours, end_time: DateTime.now.beginning_of_day + 15.hours, restourant_id: restourants(:gaggan).id)  
  end
end
