require "application_system_test_case"

class Admin::BookmarksTest < ApplicationSystemTestCase
  setup do
    @admin_bookmark = admin_bookmarks(:one)
  end

  test "visiting the index" do
    visit admin_bookmarks_url
    assert_selector "h1", text: "Bookmarks"
  end

  test "should create bookmark" do
    visit admin_bookmarks_url
    click_on "New bookmark"

    fill_in "Post", with: @admin_bookmark.post_id
    fill_in "User", with: @admin_bookmark.user_id
    click_on "Create Bookmark"

    assert_text "Bookmark was successfully created"
    click_on "Back"
  end

  test "should update Bookmark" do
    visit admin_bookmark_url(@admin_bookmark)
    click_on "Edit this bookmark", match: :first

    fill_in "Post", with: @admin_bookmark.post_id
    fill_in "User", with: @admin_bookmark.user_id
    click_on "Update Bookmark"

    assert_text "Bookmark was successfully updated"
    click_on "Back"
  end

  test "should destroy Bookmark" do
    visit admin_bookmark_url(@admin_bookmark)
    click_on "Destroy this bookmark", match: :first

    assert_text "Bookmark was successfully destroyed"
  end
end
