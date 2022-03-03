require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_login_url
    assert_response :success
  end

  test "should get get_login" do
    get login_get_login_url
    assert_response :success
  end
end
