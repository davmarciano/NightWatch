require 'test_helper'

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get new_create_url
    assert_response :success
  end

end
