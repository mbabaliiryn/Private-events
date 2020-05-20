require 'test_helper'

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_index_url
    assert_response :success
  end

end
