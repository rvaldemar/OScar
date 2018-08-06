require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get collaborations_destroy_url
    assert_response :success
  end

end
