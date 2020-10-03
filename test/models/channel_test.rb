require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test "channel should not be valid without a name" do
    channel_test = Channel.new
    assert_not channel_test.valid?
    assert_equal "can't be blank", channel_test.errors.messages[:name].first
  end

  test "name should have only letters, numbers, dashes or/and underline" do
    name_valid = Channel.new(name: "general")
    name_invalid = Channel.new(name: "g e n e r a l")
    assert name_valid.valid?
    assert_not name_invalid.valid?
    assert_equal "only allows letters, numbers, dashes or/and underlines", name_invalid.errors.messages[:name].first
  end

  test "name should be case insensitive" do
    channel_test = Channel.create(name: "GeNeRal")
    channel_test2 = Channel.new(name: "General")
    assert_not channel_test2.valid?
    assert_equal "has already been taken", channel_test2.errors.messages[:name].first
  end
end
