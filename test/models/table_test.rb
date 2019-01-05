require 'test_helper'

class TableTest < ActiveSupport::TestCase

  # Test Association
  test 'table belongs_to restourant' do
    assert_equal restourants(:bbq), tables(:bar_top).restourant
  end

  test 'table has_many reservations' do
    assert tables(:single_to_couple).reservations.exists?
  end
end
