require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel = channels(:undertale)
    @user = users(:papyrus)
  end

  test "only logged users should get index" do
    get api_v1_channel_messages_url(@channel)
    assert_response 401, "user not signed in access messages api index"

    sign_in @user

    get api_v1_channel_messages_url(@channel)
    assert_response :success, "user signed in wasn't able to access messages api index"
  end

  # test "should get create" do
  #   get api_v1_messages_create_url
  #   assert_response :success
  # end

end
