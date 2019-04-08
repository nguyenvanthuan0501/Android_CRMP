require 'test_helper'

class MissingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get missing_index_url
    assert_response :success
  end

end
