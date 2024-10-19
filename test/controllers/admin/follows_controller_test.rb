require "test_helper"

class Admin::FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_follow = admin_follows(:one)
  end

  test "should get index" do
    get admin_follows_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_follow_url
    assert_response :success
  end

  test "should create admin_follow" do
    assert_difference("Admin::Follow.count") do
      post admin_follows_url, params: { admin_follow: { user_id: @admin_follow.user_id } }
    end

    assert_redirected_to admin_follow_url(Admin::Follow.last)
  end

  test "should show admin_follow" do
    get admin_follow_url(@admin_follow)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_follow_url(@admin_follow)
    assert_response :success
  end

  test "should update admin_follow" do
    patch admin_follow_url(@admin_follow), params: { admin_follow: { user_id: @admin_follow.user_id } }
    assert_redirected_to admin_follow_url(@admin_follow)
  end

  test "should destroy admin_follow" do
    assert_difference("Admin::Follow.count", -1) do
      delete admin_follow_url(@admin_follow)
    end

    assert_redirected_to admin_follows_url
  end
end
