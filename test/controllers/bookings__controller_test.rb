require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bookings__create_url
    assert_response :success
  end

  test "should get destroy" do
    get bookings__destroy_url
    assert_response :success
  end
end
