require "test_helper"

class StatusListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get status_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get status_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get status_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get status_lists_edit_url
    assert_response :success
  end
end
