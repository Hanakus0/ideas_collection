require "test_helper"

class Users::UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_user_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get users_user_profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_user_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_user_profiles_update_url
    assert_response :success
  end
end
