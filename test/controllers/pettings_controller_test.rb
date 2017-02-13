require 'test_helper'

class PettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petting = pettings(:one)
  end

  test "should get index" do
    get pettings_url
    assert_response :success
  end

  test "should get new" do
    get new_petting_url
    assert_response :success
  end

  test "should create petting" do
    assert_difference('Petting.count') do
      post pettings_url, params: { petting: { petted_at: @petting.petted_at, petted_id: @petting.petted_id, petter_id: @petting.petter_id } }
    end

    assert_redirected_to petting_url(Petting.last)
  end

  test "should show petting" do
    get petting_url(@petting)
    assert_response :success
  end

  test "should get edit" do
    get edit_petting_url(@petting)
    assert_response :success
  end

  test "should update petting" do
    patch petting_url(@petting), params: { petting: { petted_at: @petting.petted_at, petted_id: @petting.petted_id, petter_id: @petting.petter_id } }
    assert_redirected_to petting_url(@petting)
  end

  test "should destroy petting" do
    assert_difference('Petting.count', -1) do
      delete petting_url(@petting)
    end

    assert_redirected_to pettings_url
  end
end
