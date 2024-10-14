require "application_system_test_case"

class Admin::FollowsTest < ApplicationSystemTestCase
  setup do
    @admin_follow = admin_follows(:one)
  end

  test "visiting the index" do
    visit admin_follows_url
    assert_selector "h1", text: "Follows"
  end

  test "should create follow" do
    visit admin_follows_url
    click_on "New follow"

    fill_in "User", with: @admin_follow.user_id
    click_on "Create Follow"

    assert_text "Follow was successfully created"
    click_on "Back"
  end

  test "should update Follow" do
    visit admin_follow_url(@admin_follow)
    click_on "Edit this follow", match: :first

    fill_in "User", with: @admin_follow.user_id
    click_on "Update Follow"

    assert_text "Follow was successfully updated"
    click_on "Back"
  end

  test "should destroy Follow" do
    visit admin_follow_url(@admin_follow)
    click_on "Destroy this follow", match: :first

    assert_text "Follow was successfully destroyed"
  end
end
