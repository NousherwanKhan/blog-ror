require "test_helper"

class PublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get publics_home_url
    assert_response :success
  end
end
