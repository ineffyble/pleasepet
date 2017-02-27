# require 'test_helper'
#
# class NewPetTest < ActionDispatch::IntegrationTest
#   test "create a new pet" do
#     get '/'
#     assert_response :success
#
#     get '/pets/sign_up'
#     assert_response :success
#
#     post '/pets', params: { commit: 'Sign up', pet: { email: 'petme@please.pet', password: 'petmeplease', password_confirmation: 'petmeplease', name: 'I Want Pets', page_attributes: {url: 'petme'}}}
#     assert_response :redirect
#     follow_redirect!
#     assert_response :success
#     assert_select "h1", "Please pet I Want Pets"
#   end
# end
