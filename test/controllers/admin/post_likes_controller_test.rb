require "test_helper"

class Admin::PostLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_post_like = admin_post_likes(:one)
  end

  test "should get index" do
    get admin_post_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_like_url
    assert_response :success
  end

  test "should create admin_post_like" do
    assert_difference("Admin::PostLike.count") do
      post admin_post_likes_url, params: { admin_post_like: { post_id: @admin_post_like.post_id, user_id: @admin_post_like.user_id } }
    end

    assert_redirected_to admin_post_like_url(Admin::PostLike.last)
  end

  test "should show admin_post_like" do
    get admin_post_like_url(@admin_post_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_like_url(@admin_post_like)
    assert_response :success
  end

  test "should update admin_post_like" do
    patch admin_post_like_url(@admin_post_like), params: { admin_post_like: { post_id: @admin_post_like.post_id, user_id: @admin_post_like.user_id } }
    assert_redirected_to admin_post_like_url(@admin_post_like)
  end

  test "should destroy admin_post_like" do
    assert_difference("Admin::PostLike.count", -1) do
      delete admin_post_like_url(@admin_post_like)
    end

    assert_redirected_to admin_post_likes_url
  end
end
