require 'test_helper'

class WatchlistsMovieControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get watchlists_movie_new_url
    assert_response :success
  end

  test "should get create" do
    get watchlists_movie_create_url
    assert_response :success
  end

end
