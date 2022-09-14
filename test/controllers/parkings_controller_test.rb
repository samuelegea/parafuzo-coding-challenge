require "test_helper"

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking = parkings(:one)
  end

  test "should get index" do
    get parkings_url, as: :json
    assert_response :success
  end

  test "should create parking" do
    assert_difference("Parking.count") do
      post parkings_url, params: { parking: { checkout_at: @parking.checkout_at, paid_at: @parking.paid_at, plate: @parking.plate } }, as: :json
    end

    assert_response :created
  end

  test "should show parking" do
    get parking_url(@parking), as: :json
    assert_response :success
  end

  test "should update parking" do
    patch parking_url(@parking), params: { parking: { checkout_at: @parking.checkout_at, paid_at: @parking.paid_at, plate: @parking.plate } }, as: :json
    assert_response :success
  end

  test "should destroy parking" do
    assert_difference("Parking.count", -1) do
      delete parking_url(@parking), as: :json
    end

    assert_response :no_content
  end
end
