require "application_system_test_case"

class Admin::QuoteRelationsTest < ApplicationSystemTestCase
  setup do
    @admin_quote_relation = admin_quote_relations(:one)
  end

  test "visiting the index" do
    visit admin_quote_relations_url
    assert_selector "h1", text: "Quote relations"
  end

  test "should create quote relation" do
    visit admin_quote_relations_url
    click_on "New quote relation"

    fill_in "Post", with: @admin_quote_relation.post_id
    click_on "Create Quote relation"

    assert_text "Quote relation was successfully created"
    click_on "Back"
  end

  test "should update Quote relation" do
    visit admin_quote_relation_url(@admin_quote_relation)
    click_on "Edit this quote relation", match: :first

    fill_in "Post", with: @admin_quote_relation.post_id
    click_on "Update Quote relation"

    assert_text "Quote relation was successfully updated"
    click_on "Back"
  end

  test "should destroy Quote relation" do
    visit admin_quote_relation_url(@admin_quote_relation)
    click_on "Destroy this quote relation", match: :first

    assert_text "Quote relation was successfully destroyed"
  end
end
