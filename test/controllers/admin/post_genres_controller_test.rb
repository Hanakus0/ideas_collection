require "test_helper"

class Admin::PostGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_post_genre = admin_post_genres(:one)
  end

  test "should get index" do
    get admin_post_genres_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_genre_url
    assert_response :success
  end

  test "should create admin_post_genre" do
    assert_difference("Admin::PostGenre.count") do
      post admin_post_genres_url, params: { admin_post_genre: { name: @admin_post_genre.name } }
    end

    assert_redirected_to admin_post_genre_url(Admin::PostGenre.last)
  end

  test "should show admin_post_genre" do
    get admin_post_genre_url(@admin_post_genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_genre_url(@admin_post_genre)
    assert_response :success
  end

  test "should update admin_post_genre" do
    patch admin_post_genre_url(@admin_post_genre), params: { admin_post_genre: { name: @admin_post_genre.name } }
    assert_redirected_to admin_post_genre_url(@admin_post_genre)
  end

  test "should destroy admin_post_genre" do
    assert_difference("Admin::PostGenre.count", -1) do
      delete admin_post_genre_url(@admin_post_genre)
    end

    assert_redirected_to admin_post_genres_url
  end
end
