require 'test_helper'

class MatchmakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matchmakes_index_url
    assert_response :success
  end

  test "should get new" do
    get matchmakes_new_url
    assert_response :success
  end

  test "should get edit" do
    get matchmakes_edit_url
    assert_response :success
  end

  test "should get show" do
    get matchmakes_show_url
    assert_response :success
  end

end
