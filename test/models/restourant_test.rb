require 'test_helper'

class RestourantTest < ActiveSupport::TestCase

  # Test Association
  test 'restourant has_many reservations' do
    assert restourants(:mirazur).reservations.exists?
  end

  test 'restourant has_many shifts' do
    assert restourants(:bbq).shifts.exists?
  end

  test 'restourant has_many tables' do
    assert restourants(:bbq).tables.exists?
  end

  test 'restourant has_many guest through reservations' do
    assert restourants(:mirazur).guests.exists?
  end
end
