require 'test_helper'

class AvailabilityRangesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get availability_ranges_new_url
    assert_response :success
  end

  test "should get create" do
    get availability_ranges_create_url
    assert_response :success
  end

  test "should get edit" do
    get availability_ranges_edit_url
    assert_response :success
  end

  test "should get update" do
    get availability_ranges_update_url
    assert_response :success
  end

end
