require 'test_helper'

class WoSoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wo_so_index_url
    assert_response :success
  end

end
