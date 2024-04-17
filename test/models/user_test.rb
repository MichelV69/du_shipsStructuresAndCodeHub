require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "a new user must have an email address & password" do
    u = User.new

    u.email = nil
    u.password = "cleverPWD"
    assert_not u.save

    u.email = "an_email@example.com"
    u.password = nil
    assert_not u.save

    u.email = "an_email@example.com"
    u.password = "cleverPWD"
    assert u.save!
  end

  test "we can find a user by email address" do
    u = User.find_by_email "second_person@example.com"
    assert_not u == nil
    assert_not u.id == nil
  end
end
