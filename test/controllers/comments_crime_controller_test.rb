require 'test_helper'

class CommentsCrimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comments_crime_index_url
    assert_response :success
  end

end
