require "test_helper"

class Admin::CommentLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_comment_like = admin_comment_likes(:one)
  end

  test "should get index" do
    get admin_comment_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_comment_like_url
    assert_response :success
  end

  test "should create admin_comment_like" do
    assert_difference("Admin::CommentLike.count") do
      post admin_comment_likes_url, params: { admin_comment_like: { comment_id: @admin_comment_like.comment_id, user_id: @admin_comment_like.user_id } }
    end

    assert_redirected_to admin_comment_like_url(Admin::CommentLike.last)
  end

  test "should show admin_comment_like" do
    get admin_comment_like_url(@admin_comment_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_comment_like_url(@admin_comment_like)
    assert_response :success
  end

  test "should update admin_comment_like" do
    patch admin_comment_like_url(@admin_comment_like), params: { admin_comment_like: { comment_id: @admin_comment_like.comment_id, user_id: @admin_comment_like.user_id } }
    assert_redirected_to admin_comment_like_url(@admin_comment_like)
  end

  test "should destroy admin_comment_like" do
    assert_difference("Admin::CommentLike.count", -1) do
      delete admin_comment_like_url(@admin_comment_like)
    end

    assert_redirected_to admin_comment_likes_url
  end
end
