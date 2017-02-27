require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should show index" do
    get '/'
    assert_response :success
  end
end
