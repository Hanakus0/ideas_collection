require "application_system_test_case"

class Admin::CommentLikesTest < ApplicationSystemTestCase
  setup do
    @admin_comment_like = admin_comment_likes(:one)
  end

  test "visiting the index" do
    visit admin_comment_likes_url
    assert_selector "h1", text: "Comment likes"
  end

  test "should create comment like" do
    visit admin_comment_likes_url
    click_on "New comment like"

    fill_in "Comment", with: @admin_comment_like.comment_id
    fill_in "User", with: @admin_comment_like.user_id
    click_on "Create Comment like"

    assert_text "Comment like was successfully created"
    click_on "Back"
  end

  test "should update Comment like" do
    visit admin_comment_like_url(@admin_comment_like)
    click_on "Edit this comment like", match: :first

    fill_in "Comment", with: @admin_comment_like.comment_id
    fill_in "User", with: @admin_comment_like.user_id
    click_on "Update Comment like"

    assert_text "Comment like was successfully updated"
    click_on "Back"
  end

  test "should destroy Comment like" do
    visit admin_comment_like_url(@admin_comment_like)
    click_on "Destroy this comment like", match: :first

    assert_text "Comment like was successfully destroyed"
  end
end
