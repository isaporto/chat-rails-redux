require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test "channel should not be valid without a name" do
    channel_test = Channel.new
    assert_not channel_test.valid?
    assert_equal "can't be blank", channel_test.errors.messages[:name].first
  end
end
