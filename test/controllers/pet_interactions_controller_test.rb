require 'test_helper'

class PetInteractionsControllerTest < ActionDispatch::IntegrationTest
  test "should do a petting" do
    assert_difference('PetInteraction.find_by(petter_id: false, petted_id: 2).total_pettings') do
      post '/kitten/petting', params: { this_many: 1 }
    end
  end
  test "should do many pettings" do
    assert_difference('PetInteraction.find_by(petter_id: false, petted_id: 2).total_pettings', 5) do
      post '/kitten/petting', params: { this_many: 5 }
    end
  end
  test "should not do too many pettings" do
    post '/kitten/petting', params: { this_many: 188 }
    assert_response :too_many_requests
  end
  test "should not do negative pettings" do
    post '/kitten/petting', params: { this_many: -188 }
    assert_response :bad_request
  end
  test "should not allow anonymous pettings" do
    post '/bun/petting', params: { this_many: 1 }
    assert_response :unauthorized
  end
end
