require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get auth_signup_url
    assert_response :success
  end

  test "should get register" do
    get auth_register_url
    assert_response :success
  end

  test "should get signin" do
    get auth_signin_url
    assert_response :success
  end

  test "should get authenticate" do
    get auth_authenticate_url
    assert_response :success
  end

  test "should get signout" do
    get auth_signout_url
    assert_response :success
  end
end
