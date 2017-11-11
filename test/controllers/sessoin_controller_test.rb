require 'test_helper'

class SessoinControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessoin_new_url
    assert_response :success
  end

end
