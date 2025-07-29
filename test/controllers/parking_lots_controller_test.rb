require "test_helper"

class ParkingLotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parking_lots_new_url
    assert_response :success
  end

  test "should get index" do
    get parking_lots_index_url
    assert_response :success
  end

  test "should get show" do
    get parking_lots_show_url
    assert_response :success
  end
end
