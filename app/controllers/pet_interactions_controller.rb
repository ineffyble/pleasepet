class PetInteractionsController < ApplicationController
  before_action :set_pet_interactions, only: [:index]
  before_action :set_page_and_pet, only: [:do_a_petting, :how_many_pettings]
  before_action :not_too_many_pettings, only: [:do_a_petting]
  before_action :only_wanted_pettings, only: [:do_a_petting]

  def index; end

  def do_a_petting
    if current_pet
      pet_interaction = PetInteraction.find_or_create_by(petter_id: current_pet.id, petted_id: @pet.id)
    else
      pet_interaction = PetInteraction.find_or_create_by(petter_id: false, petted_id: @pet.id)
    end
    if pet_interaction.first_petting.nil?
      pet_interaction.first_petting = DateTime.now.utc
    end
    pet_interaction.increment(:total_pettings, params[:this_many])
    pet_interaction.last_petting = DateTime.now.utc
    pet_interaction.save!
    @pet.increment(:received_pettings_count, params[:this_many])
    @pet.save!
    if current_pet
      current_pet.increment(:performed_pettings_count, params[:this_many])
      current_pet.save!
    end
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
    def set_pet_interactions
      @petters = PetInteraction.where("petted_id=?", current_pet.id)
      @petted = PetInteraction.where("petter_id=?", current_pet.id)
    end

    def set_page_and_pet
      params[:url].downcase!
      @page = Page.find_by! url: params[:url]
      @pet = @page.pet
    end

    def not_too_many_pettings
      if params[:this_many].nil?
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
      unless @page.allow_anon_petting
        render status: :unauthorized, inline: '<img src="//http.cat/401">'
      end
    end
end
