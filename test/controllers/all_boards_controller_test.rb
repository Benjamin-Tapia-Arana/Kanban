require "test_helper"

class AllBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_boards_index_url
    assert_response :success
  end
end
