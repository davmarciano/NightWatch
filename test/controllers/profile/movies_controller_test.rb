require 'test_helper'

class Profile::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_movies_index_url
    assert_response :success
  end

end
