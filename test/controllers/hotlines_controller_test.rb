require 'test_helper'

class HotlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hotlines_index_url
    assert_response :success
  end

end
