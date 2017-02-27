class PetInteractionsController < ApplicationController
  # Find appropriate records
  before_action :set_pet_interactions_for_pet, only: [:index]
  before_action :set_page_and_pet, only: [:do_a_petting, :how_many_pettings]
  before_action :set_pet_interaction, only: [:do_a_petting]
  # Verify legitimacy of incoming petting parameters
  before_action :not_too_many_pettings, only: [:do_a_petting]
  before_action :only_wanted_pettings, only: [:do_a_petting]

  def index; end

  def do_a_petting
    increment_pet_pettings(@pet, 'received', params[:this_many])
    if current_pet
      increment_pet_pettings(current_pet, 'performed', params[:this_many])
    end
    increment_total_pettings(@pet_interaction, params[:this_many])
    set_interaction_dates(@pet_interaction)
  end

  def how_many_pettings
    if params[:petter_id]
      pet_interaction = PetInteraction.find_by(petted_id: @pet.id, petter_id: params[:petter_id])
      petting_count = pet_interaction.total_pettings
    else
      petting_count = @pet.received_pettings_count
    end
    respond_to do |format|
      format.json { render json: { count: petting_count } }
    end
  end

  private

  def set_pet_interactions_for_pet
    @petters = PetInteraction.where("petted_id=?", current_pet.id)
    @petted = PetInteraction.where("petter_id=?", current_pet.id)
  end

  def set_pet_interaction
    if current_pet
      @pet_interaction = PetInteraction.find_or_create_by(petter_id: current_pet.id, petted_id: @pet.id)
    else
      @pet_interaction = PetInteraction.find_or_create_by(petter_id: false, petted_id: @pet.id)
    end
  end

  def set_page_and_pet
    params[:url].downcase!
    @page = Page.find_by! url: params[:url]
    @pet = @page.pet
  end

  def not_too_many_pettings
    if params[:this_many] && params[:this_many].to_i
      params[:this_many] = params[:this_many].to_i
    else
      params[:this_many] = 1
    end
    if params[:this_many] > 17
      # 18 is too many pettings
      render status: :too_many_requests, inline: '<img src="//http.cat/429">'
    end
    if params[:this_many] < 0
      # No negative petting!
      render status: :bad_request, inline: '<img src="//http.cat/400">'
    end
  end

  def only_wanted_pettings
    unless current_pet || @page.allow_anon_petting
      render status: :unauthorized, inline: '<img src="//http.cat/401">'
    end
  end

  def increment_pet_pettings(pet, counter_type, amount)
    if counter_type == 'performed'
      pet.increment(:performed_pettings_count, amount)
    else
      pet.increment(:received_pettings_count, amount)
    end
    pet.save!
  end

  def increment_total_pettings(pet_interaction, amount)
    pet_interaction.increment(:total_pettings, amount)
    pet_interaction.save!
  end

  def set_interaction_dates(pet_interaction)
    now = DateTime.now.utc
    if pet_interaction.first_petting.nil?
      pet_interaction.first_petting = now
    end
    unless pet_interaction.last_petting? && pet_interaction.last_petting < now
      pet_interaction.last_petting = now
    end
    pet_interaction.save!
  end
end
