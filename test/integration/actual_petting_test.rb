require 'test_helper'

class ActualPettingTest < ActionDispatch::IntegrationTest
  test "pet the kitten" do
    get '/kitten'
    assert_response :success
    assert_select "#petcount", "5"
    assert_select 'input[value=?]', 'Pet kitten'
    post '/kitten/petting', params: {this_many: 7}
    assert_response :success
    get '/kitten'
    assert_response :success
    assert_select "#petcount", "12"
  end
  test "cannot pet the bun" do
    get '/bun'
    assert_response :success
    assert_select "#petcount", "22"
    assert_select 'input[value=?]', 'Login to pet bun'
    post '/bun/petting', params: {this_many: 2}
    assert_response :unauthorized
    get '/bun'
    assert_select "#petcount", "22"
  end
end
