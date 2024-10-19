require "test_helper"

class Admin::PostTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_post_tag = admin_post_tags(:one)
  end

  test "should get index" do
    get admin_post_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_tag_url
    assert_response :success
  end

  test "should create admin_post_tag" do
    assert_difference("Admin::PostTag.count") do
      post admin_post_tags_url, params: { admin_post_tag: { post_id: @admin_post_tag.post_id, tag_id: @admin_post_tag.tag_id } }
    end

    assert_redirected_to admin_post_tag_url(Admin::PostTag.last)
  end

  test "should show admin_post_tag" do
    get admin_post_tag_url(@admin_post_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_tag_url(@admin_post_tag)
    assert_response :success
  end

  test "should update admin_post_tag" do
    patch admin_post_tag_url(@admin_post_tag), params: { admin_post_tag: { post_id: @admin_post_tag.post_id, tag_id: @admin_post_tag.tag_id } }
    assert_redirected_to admin_post_tag_url(@admin_post_tag)
  end

  test "should destroy admin_post_tag" do
    assert_difference("Admin::PostTag.count", -1) do
      delete admin_post_tag_url(@admin_post_tag)
    end

    assert_redirected_to admin_post_tags_url
  end
end
