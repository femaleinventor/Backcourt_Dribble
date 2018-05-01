require 'test_helper'

class DribbleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dribble_index_url
    assert_response :success
  end

end
