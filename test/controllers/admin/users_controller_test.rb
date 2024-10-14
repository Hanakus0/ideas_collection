require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = admin_users(:one)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should create admin_user" do
    assert_difference("Admin::User.count") do
      post admin_users_url, params: { admin_user: { age: @admin_user.age, gender: @admin_user.gender, introduction: @admin_user.introduction, name: @admin_user.name, profile_image: @admin_user.profile_image, user_uid: @admin_user.user_uid } }
    end

    assert_redirected_to admin_user_url(Admin::User.last)
  end

  test "should show admin_user" do
    get admin_user_url(@admin_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_url(@admin_user)
    assert_response :success
  end

  test "should update admin_user" do
    patch admin_user_url(@admin_user), params: { admin_user: { age: @admin_user.age, gender: @admin_user.gender, introduction: @admin_user.introduction, name: @admin_user.name, profile_image: @admin_user.profile_image, user_uid: @admin_user.user_uid } }
    assert_redirected_to admin_user_url(@admin_user)
  end

  test "should destroy admin_user" do
    assert_difference("Admin::User.count", -1) do
      delete admin_user_url(@admin_user)
    end

    assert_redirected_to admin_users_url
  end
end
