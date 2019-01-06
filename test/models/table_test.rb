require 'test_helper'

class TableTest < ActiveSupport::TestCase

  # Test Association
  test 'table belongs_to restourant' do
    assert_equal restourants(:bbq), tables(:bar_top).restourant
  end

  test 'table has_many reservations' do
    assert tables(:single_to_couple).reservations.exists?
  end

  # Test Validations

  test 'save valid table' do
    table = new_table
    assert table.valid?
    table.save
    assert_equal 0, table.errors.count
  end

  test 'min_max_guest_count on create' do
    table = new_table
    table.min_num = 13
    assert_not table.valid?
    table.save
    assert_equal 1, table.errors.count
    assert_equal "Min guest count can't be greater than max guest count", table.errors.messages[:min_num][0]
  end

  test 'min_max_guest_count on update' do
    table = tables(:two_to_four_table)
    table.min_num = 13
    assert_not table.valid?
    table.save
    assert_equal 1, table.errors.count
    assert_equal "Min guest count can't be greater than max guest count", table.errors.messages[:min_num][0]
  end

  private

  def new_table
    Table.new(name: "Test table", min_num: 4, max_num: 12, restourant_id: restourants(:gaggan).id)  
  end
end
