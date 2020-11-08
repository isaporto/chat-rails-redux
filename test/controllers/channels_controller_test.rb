require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel = channels(:undertale)
    @user = users(:papyrus)
  end

  test "should get show only logged" do
    get channel_url(@channel)
    assert_redirected_to new_user_session_url, "user not signed in access channel show"

    sign_in @user

    get channel_url(@channel)
    assert_response :success, "user signed in wasn't able to access channel show"
  end

end
