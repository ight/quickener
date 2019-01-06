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

  # Test validations
  test 'test valid restourant save' do
    restourant = new_restourant
    assert restourant.valid?
    restourant.save
    assert_equal 0, restourant.errors.count
  end

  test 'test name presence on create' do
    restourant = new_restourant
    restourant.name = nil
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "can't be blank", restourant.errors.messages[:name][0]
  end

  test 'test name presence on update' do
    restourant = restourants(:bbq)
    restourant.name = nil
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "can't be blank", restourant.errors.messages[:name][0]
  end

  test 'test email presence on create' do
    restourant = new_restourant
    restourant.email = nil
    assert_not restourant.valid?
    restourant.save
    assert_equal 2, restourant.errors.count
    assert ["can't be blank", "not properly formated"].include?(restourant.errors.messages[:email][0])
    assert ["can't be blank", "not properly formated"].include?(restourant.errors.messages[:email][1])
  end

  test 'test email presence on update' do
    restourant = restourants(:bbq)
    restourant.email = nil
    assert_not restourant.valid?
    restourant.save
    assert_equal 2, restourant.errors.count
    assert ["can't be blank", "not properly formated"].include?(restourant.errors.messages[:email][0])
    assert ["can't be blank", "not properly formated"].include?(restourant.errors.messages[:email][1])
  end

  test 'test email uniqueness on create' do
    restourant = new_restourant
    restourant.email = restourants(:bbq).email
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "has already been taken", restourant.errors.messages[:email][0]
  end

  test 'test email uniqueness on update' do
    restourant = restourants(:mirazur)
    restourant.email = restourants(:bbq).email
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "has already been taken", restourant.errors.messages[:email][0]
  end

  test 'test email format' do
    restourant = new_restourant
    restourant.email = "himranhasmi@bolly@movie.com"
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "not properly formated", restourant.errors.messages[:email][0]
  end

  test 'presence of phone number' do
    restourant = new_restourant
    restourant.phone = nil
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "is invalid", restourant.errors.messages[:phone][0]
  end

  test 'phone number out of india or canada' do
    restourant = new_restourant
    # number not from india or canada
    restourant.phone = "+61 2 9876 5432"
    assert_not restourant.valid?
    restourant.save
    assert_equal 1, restourant.errors.count
    assert_equal "is invalid", restourant.errors.messages[:phone][0]
  end  
  
  private

  def new_restourant
    Restourant.new(name: "test restourant", email: "testrestourant@gmail.com", phone: "9991112222")
  end
end
