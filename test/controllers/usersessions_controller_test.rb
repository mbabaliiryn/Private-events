require 'test_helper'

class UsersessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usersessions_new_url
    assert_response :success
  end

end
