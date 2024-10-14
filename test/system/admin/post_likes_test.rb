require "application_system_test_case"

class Admin::PostLikesTest < ApplicationSystemTestCase
  setup do
    @admin_post_like = admin_post_likes(:one)
  end

  test "visiting the index" do
    visit admin_post_likes_url
    assert_selector "h1", text: "Post likes"
  end

  test "should create post like" do
    visit admin_post_likes_url
    click_on "New post like"

    fill_in "Post", with: @admin_post_like.post_id
    fill_in "User", with: @admin_post_like.user_id
    click_on "Create Post like"

    assert_text "Post like was successfully created"
    click_on "Back"
  end

  test "should update Post like" do
    visit admin_post_like_url(@admin_post_like)
    click_on "Edit this post like", match: :first

    fill_in "Post", with: @admin_post_like.post_id
    fill_in "User", with: @admin_post_like.user_id
    click_on "Update Post like"

    assert_text "Post like was successfully updated"
    click_on "Back"
  end

  test "should destroy Post like" do
    visit admin_post_like_url(@admin_post_like)
    click_on "Destroy this post like", match: :first

    assert_text "Post like was successfully destroyed"
  end
end
