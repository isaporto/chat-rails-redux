require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "message should not be valid without content" do
    message_test = Message.new(user: users(:papyrus), channel: channels(:undertale))
    assert_not message_test.valid?
    assert_equal "can't be blank", message_test.errors.messages[:content].first
  end
end
