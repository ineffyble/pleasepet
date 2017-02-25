namespace :pettings do
  desc "TODO"
  task sync_counter_cache: :environment do
    Pet.find_each { |pet| Pet.reset_counters(pet.id, :received_pettings) }
    Pet.find_each { |pet| Pet.reset_counters(pet.id, :performed_pettings) }
  end
  # Legacy for migration from Pettings model to PetInteractions model
  task migrate: :environment do
    Rails.logger = Logger.new(STDOUT)
    Rails.logger.level = Logger::DEBUG
    Petting.find_each do |petting|
      if petting.petter_id
        pet_interaction = PetInteraction.find_or_create_by(petter_id: petting.petter_id, petted_id: petting.petted_id)
      else
        pet_interaction = PetInteraction.find_or_create_by(petter_id: false, petted_id: petting.petted_id)
      end
      if pet_interaction.first_petting.nil?
        pet_interaction.first_petting = petting.petted_at
      end
      if pet_interaction.first_petting > petting.petted_at
        pet_interaction.first_petting = petting.petted_at
      end
      if pet_interaction.last_petting.nil?
        pet_interaction.last_petting = petting.petted_at
      end
      if pet_interaction.last_petting < petting.petted_at
        pet_interaction.last_petting = petting.petted_at
      end
      pet_interaction.increment(:total_pettings, 1)
      pet_interaction.save!
      petting.destroy!
    end
  end
end
