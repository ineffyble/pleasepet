require 'test_helper'

class NoisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @noise = noises(:one)
  end

  test "should get index" do
    get noises_url
    assert_response :success
  end

  test "should get new" do
    get new_noise_url
    assert_response :success
  end

  test "should create noise" do
    assert_difference('Noise.count') do
      post noises_url, params: { noise: {  } }
    end

    assert_redirected_to noise_url(Noise.last)
  end

  test "should show noise" do
    get noise_url(@noise)
    assert_response :success
  end

  test "should get edit" do
    get edit_noise_url(@noise)
    assert_response :success
  end

  test "should update noise" do
    patch noise_url(@noise), params: { noise: {  } }
    assert_redirected_to noise_url(@noise)
  end

  test "should destroy noise" do
    assert_difference('Noise.count', -1) do
      delete noise_url(@noise)
    end

    assert_redirected_to noises_url
  end
end
