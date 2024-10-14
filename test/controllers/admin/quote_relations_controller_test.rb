require "test_helper"

class Admin::QuoteRelationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_quote_relation = admin_quote_relations(:one)
  end

  test "should get index" do
    get admin_quote_relations_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_quote_relation_url
    assert_response :success
  end

  test "should create admin_quote_relation" do
    assert_difference("Admin::QuoteRelation.count") do
      post admin_quote_relations_url, params: { admin_quote_relation: { post_id: @admin_quote_relation.post_id } }
    end

    assert_redirected_to admin_quote_relation_url(Admin::QuoteRelation.last)
  end

  test "should show admin_quote_relation" do
    get admin_quote_relation_url(@admin_quote_relation)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_quote_relation_url(@admin_quote_relation)
    assert_response :success
  end

  test "should update admin_quote_relation" do
    patch admin_quote_relation_url(@admin_quote_relation), params: { admin_quote_relation: { post_id: @admin_quote_relation.post_id } }
    assert_redirected_to admin_quote_relation_url(@admin_quote_relation)
  end

  test "should destroy admin_quote_relation" do
    assert_difference("Admin::QuoteRelation.count", -1) do
      delete admin_quote_relation_url(@admin_quote_relation)
    end

    assert_redirected_to admin_quote_relations_url
  end
end
