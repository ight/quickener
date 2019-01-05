require 'test_helper'

class ShiftTest < ActiveSupport::TestCase

  # Test Association
  test 'shift belongs_to restourant' do
    assert_equal restourants(:bbq), shifts(:morning).restourant
  end

  test 'shift has_many reservations' do
    assert shifts(:morning).reservations.exists?
  end
end
