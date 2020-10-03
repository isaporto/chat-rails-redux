require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should not be valid without username" do
    user_test = User.new(email:"teste@teste", password: "123123")
    assert_not user_test.valid?
    assert_equal "can't be blank", user_test.errors.messages[:username].first
  end
end
