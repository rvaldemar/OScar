require 'test_helper'

class ReposControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get repos_show_url
    assert_response :success
  end

  test "should get create" do
    get repos_create_url
    assert_response :success
  end

  test "should get update" do
    get repos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get repos_destroy_url
    assert_response :success
  end

end
