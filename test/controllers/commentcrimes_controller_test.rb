require 'test_helper'

class CommentcrimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commentcrimes_index_url
    assert_response :success
  end

end
