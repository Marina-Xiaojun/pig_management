require "test_helper"

class IntroductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get introductions_new_url
    assert_response :success
  end
end
