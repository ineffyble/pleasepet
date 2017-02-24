class PettingsInserterWorker
  include Sidekiq::Worker

  def perform(petted_at, petted_id, petter_id)
    if petter_id
      pet_interaction = PetInteraction.find_or_create_by(petter_id: petter_id, petted_id: petted_id)
    else
      pet_interaction = PetInteraction.find_or_create_by(petter_id: false, petted_id: petted_id)
    end
    if pet_interaction.first_petting.nil?
      pet_interaction.first_petting = petted_at
    end
    if pet_interaction.last_petting < petted_at
      pet_interaction.last_petting = petted_at
    end
    pet_interaction.increment(:total_pettings, 1)
    pet_interaction.save!
    pet = Pet.find(petted_id)
    pet.increment(:received_pettings_count, 1).save!
    if petter_id
      petter = Pet.find(petter_id)
      pettert.increment(:performed_pettings_count, 1).save!
    end
end
