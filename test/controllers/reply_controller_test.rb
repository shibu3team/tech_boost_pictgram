require 'test_helper'

class ReplyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reply_new_url
    assert_response :success
  end

end
