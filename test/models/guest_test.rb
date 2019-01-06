require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  # Test Association
  test 'guest has_many reservations' do
    assert guests(:prakash_guest).reservations.exists?
  end

  test 'guest has_many restourants through reservations' do
    assert guests(:prakash_guest).restourants.exists?
  end

  # Test validations
  test 'test valid user save' do
    guest = new_guest
    assert guest.valid?
    guest.save
    assert_equal 0, guest.errors.count
  end

  test 'test name presence on create' do
    guest = new_guest
    guest.name = nil
    assert_not guest.valid?
    guest.save
    assert_equal 1, guest.errors.count
    assert_equal "can't be blank", guest.errors.messages[:name][0]
  end

  test 'test name presence on update' do
    guest = guests(:prakash_guest)
    guest.name = nil
    assert_not guest.valid?
    guest.save
    assert_equal 1, guest.errors.count
    assert_equal "can't be blank", guest.errors.messages[:name][0]
  end

  test 'test email presence on create' do
    guest = new_guest
    guest.email = nil
    assert_not guest.valid?
    guest.save
    assert_equal 2, guest.errors.count
    assert ["can't be blank", "not properly formated"].include?(guest.errors.messages[:email][0])
    assert ["can't be blank", "not properly formated"].include?(guest.errors.messages[:email][1])
  end

  test 'test email presence on update' do
    guest = guests(:prakash_guest)
    guest.email = nil
    assert_not guest.valid?
    guest.save
    assert_equal 2, guest.errors.count
    assert ["can't be blank", "not properly formated"].include?(guest.errors.messages[:email][0])
    assert ["can't be blank", "not properly formated"].include?(guest.errors.messages[:email][1])
  end

  test 'test email uniqueness on create' do
    guest = new_guest
    guest.email = guests(:prakash_guest).email
    assert_not guest.valid?
    guest.save
    assert_equal 1, guest.errors.count
    assert_equal "has already been taken", guest.errors.messages[:email][0]
  end

  test 'test email uniqueness on update' do
    guest = guests(:ready_guest)
    guest.email = guests(:prakash_guest).email
    assert_not guest.valid?
    guest.save
    assert_equal 1, guest.errors.count
    assert_equal "has already been taken", guest.errors.messages[:email][0]
  end

  test 'test email format' do
    guest = new_guest
    guest.email = "himranhasmi@bolly@movie.com"
    assert_not guest.valid?
    guest.save
    assert_equal 1, guest.errors.count
    assert_equal "not properly formated", guest.errors.messages[:email][0]
  end
  
  private

  def new_guest
    Guest.new(name: "test user", email: "testuser@gmail.com")
  end
end
