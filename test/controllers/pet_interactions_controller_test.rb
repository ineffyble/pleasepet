require 'test_helper'

class PetInteractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_interaction = pet_interactions(:one)
  end

  test "should get index" do
    get pet_interactions_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_interaction_url
    assert_response :success
  end

  test "should create pet_interaction" do
    assert_difference('PetInteraction.count') do
      post pet_interactions_url, params: { pet_interaction: { first_petting: @pet_interaction.first_petting, last_petting: @pet_interaction.last_petting, petted_id: @pet_interaction.petted_id, petter_id: @pet_interaction.petter_id, total_pettings: @pet_interaction.total_pettings } }
    end

    assert_redirected_to pet_interaction_url(PetInteraction.last)
  end

  test "should show pet_interaction" do
    get pet_interaction_url(@pet_interaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_interaction_url(@pet_interaction)
    assert_response :success
  end

  test "should update pet_interaction" do
    patch pet_interaction_url(@pet_interaction), params: { pet_interaction: { first_petting: @pet_interaction.first_petting, last_petting: @pet_interaction.last_petting, petted_id: @pet_interaction.petted_id, petter_id: @pet_interaction.petter_id, total_pettings: @pet_interaction.total_pettings } }
    assert_redirected_to pet_interaction_url(@pet_interaction)
  end

  test "should destroy pet_interaction" do
    assert_difference('PetInteraction.count', -1) do
      delete pet_interaction_url(@pet_interaction)
    end

    assert_redirected_to pet_interactions_url
  end
end
