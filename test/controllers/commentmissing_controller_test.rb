require 'test_helper'

class CommentmissingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commentmissing_index_url
    assert_response :success
  end

end
