require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  # Test Association
  test 'guest has_many reservations' do
    assert guests(:prakash_guest).reservations.exists?
  end

  test 'guest has_many restourants through reservations' do
    assert guests(:prakash_guest).restourants.exists?
  end
end
