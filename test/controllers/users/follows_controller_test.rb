require "test_helper"

class Users::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_follows_index_url
    assert_response :success
  end
end
