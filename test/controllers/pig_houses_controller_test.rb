require "test_helper"

class PigHousesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pig_houses_new_url
    assert_response :success
  end
end
