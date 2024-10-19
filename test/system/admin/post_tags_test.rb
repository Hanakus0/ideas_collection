require "application_system_test_case"

class Admin::PostTagsTest < ApplicationSystemTestCase
  setup do
    @admin_post_tag = admin_post_tags(:one)
  end

  test "visiting the index" do
    visit admin_post_tags_url
    assert_selector "h1", text: "Post tags"
  end

  test "should create post tag" do
    visit admin_post_tags_url
    click_on "New post tag"

    fill_in "Post", with: @admin_post_tag.post_id
    fill_in "Tag", with: @admin_post_tag.tag_id
    click_on "Create Post tag"

    assert_text "Post tag was successfully created"
    click_on "Back"
  end

  test "should update Post tag" do
    visit admin_post_tag_url(@admin_post_tag)
    click_on "Edit this post tag", match: :first

    fill_in "Post", with: @admin_post_tag.post_id
    fill_in "Tag", with: @admin_post_tag.tag_id
    click_on "Update Post tag"

    assert_text "Post tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Post tag" do
    visit admin_post_tag_url(@admin_post_tag)
    click_on "Destroy this post tag", match: :first

    assert_text "Post tag was successfully destroyed"
  end
end
