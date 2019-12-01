require 'test_helper'

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watchlists_index_url
    assert_response :success
  end

end
