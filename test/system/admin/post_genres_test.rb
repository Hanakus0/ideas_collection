require "application_system_test_case"

class Admin::PostGenresTest < ApplicationSystemTestCase
  setup do
    @admin_post_genre = admin_post_genres(:one)
  end

  test "visiting the index" do
    visit admin_post_genres_url
    assert_selector "h1", text: "Post genres"
  end

  test "should create post genre" do
    visit admin_post_genres_url
    click_on "New post genre"

    fill_in "Name", with: @admin_post_genre.name
    click_on "Create Post genre"

    assert_text "Post genre was successfully created"
    click_on "Back"
  end

  test "should update Post genre" do
    visit admin_post_genre_url(@admin_post_genre)
    click_on "Edit this post genre", match: :first

    fill_in "Name", with: @admin_post_genre.name
    click_on "Update Post genre"

    assert_text "Post genre was successfully updated"
    click_on "Back"
  end

  test "should destroy Post genre" do
    visit admin_post_genre_url(@admin_post_genre)
    click_on "Destroy this post genre", match: :first

    assert_text "Post genre was successfully destroyed"
  end
end
