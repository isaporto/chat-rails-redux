require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should not be valid without username" do
    user_test = User.new(email:"teste@teste", password: "123123")
    assert_not user_test.valid?
    assert_equal "can't be blank", user_test.errors.messages[:username].first
  end

  test "username should have length between 3 and 20" do
    username_short = User.new(username: "is", email:"teste@teste", password: "123123")
    username_enough = User.new(username: "isa", email:"teste@teste", password: "123123")
    username_long = User.new(username: "isabelamukotakoporto8", email:"teste@teste", password: "123123")
    username_almost = User.new(username: "isabelamukotakoporto", email:"teste@teste", password: "123123")
    assert_not username_short.valid?, "Username with length 2 is valid"
    assert username_enough.valid?, "Username with length 3 is invalid"
    assert_not username_long.valid?, "Username with length 21 is valid"
    assert username_almost.valid?, "Username with length 20 is invalid"
  end

  test "username should have only letters, numbers, dashes or/and underline" do
    username_valid = User.new(username: "Is4BeL4-ch4N", email:"teste@teste", password: "123123")
    username_invalid = User.new(username: "!s4 playplay *1000", email:"teste@teste", password: "123123")
    assert username_valid.valid?
    assert_not username_invalid.valid?
    assert_equal "only allows letters, numbers, dashes or/and underlines", username_invalid.errors.messages[:username].first
  end
end
