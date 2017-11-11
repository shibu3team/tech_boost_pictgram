require 'test_helper'

class SessoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessoins_new_url
    assert_response :success
  end

end
