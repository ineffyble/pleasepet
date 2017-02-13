require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get index_view_url
    assert_response :success
  end

end
