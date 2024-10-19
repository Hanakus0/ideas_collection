require "application_system_test_case"

class Admin::PostRecordsTest < ApplicationSystemTestCase
  setup do
    @admin_post_record = admin_post_records(:one)
  end

  test "visiting the index" do
    visit admin_post_records_url
    assert_selector "h1", text: "Post records"
  end

  test "should create post record" do
    visit admin_post_records_url
    click_on "New post record"

    fill_in "Post", with: @admin_post_record.post_id
    fill_in "View count", with: @admin_post_record.view_count
    click_on "Create Post record"

    assert_text "Post record was successfully created"
    click_on "Back"
  end

  test "should update Post record" do
    visit admin_post_record_url(@admin_post_record)
    click_on "Edit this post record", match: :first

    fill_in "Post", with: @admin_post_record.post_id
    fill_in "View count", with: @admin_post_record.view_count
    click_on "Update Post record"

    assert_text "Post record was successfully updated"
    click_on "Back"
  end

  test "should destroy Post record" do
    visit admin_post_record_url(@admin_post_record)
    click_on "Destroy this post record", match: :first

    assert_text "Post record was successfully destroyed"
  end
end
