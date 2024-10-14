require "test_helper"

class Admin::BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_bookmark = admin_bookmarks(:one)
  end

  test "should get index" do
    get admin_bookmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_bookmark_url
    assert_response :success
  end

  test "should create admin_bookmark" do
    assert_difference("Admin::Bookmark.count") do
      post admin_bookmarks_url, params: { admin_bookmark: { post_id: @admin_bookmark.post_id, user_id: @admin_bookmark.user_id } }
    end

    assert_redirected_to admin_bookmark_url(Admin::Bookmark.last)
  end

  test "should show admin_bookmark" do
    get admin_bookmark_url(@admin_bookmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_bookmark_url(@admin_bookmark)
    assert_response :success
  end

  test "should update admin_bookmark" do
    patch admin_bookmark_url(@admin_bookmark), params: { admin_bookmark: { post_id: @admin_bookmark.post_id, user_id: @admin_bookmark.user_id } }
    assert_redirected_to admin_bookmark_url(@admin_bookmark)
  end

  test "should destroy admin_bookmark" do
    assert_difference("Admin::Bookmark.count", -1) do
      delete admin_bookmark_url(@admin_bookmark)
    end

    assert_redirected_to admin_bookmarks_url
  end
end
