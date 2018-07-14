require 'test_helper'

class WallControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wall_index_url
    assert_response :success
  end

end
