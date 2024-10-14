require "test_helper"

class Admin::PostRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_post_record = admin_post_records(:one)
  end

  test "should get index" do
    get admin_post_records_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_record_url
    assert_response :success
  end

  test "should create admin_post_record" do
    assert_difference("Admin::PostRecord.count") do
      post admin_post_records_url, params: { admin_post_record: { post_id: @admin_post_record.post_id, view_count: @admin_post_record.view_count } }
    end

    assert_redirected_to admin_post_record_url(Admin::PostRecord.last)
  end

  test "should show admin_post_record" do
    get admin_post_record_url(@admin_post_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_record_url(@admin_post_record)
    assert_response :success
  end

  test "should update admin_post_record" do
    patch admin_post_record_url(@admin_post_record), params: { admin_post_record: { post_id: @admin_post_record.post_id, view_count: @admin_post_record.view_count } }
    assert_redirected_to admin_post_record_url(@admin_post_record)
  end

  test "should destroy admin_post_record" do
    assert_difference("Admin::PostRecord.count", -1) do
      delete admin_post_record_url(@admin_post_record)
    end

    assert_redirected_to admin_post_records_url
  end
end
