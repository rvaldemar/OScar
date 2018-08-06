require 'test_helper'

class User::ReposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_repos_index_url
    assert_response :success
  end

  test "should get create" do
    get user_repos_create_url
    assert_response :success
  end

  test "should get new" do
    get user_repos_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_repos_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_repos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_repos_destroy_url
    assert_response :success
  end

end
