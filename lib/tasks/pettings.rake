namespace :pettings do
  desc "TODO"
  task sync_counter_cache: :environment do
    Pet.find_each { |pet| Pet.reset_counters(pet.id, :received_pettings) }
    Pet.find_each { |pet| Pet.reset_counters(pet.id, :performed_pettings) }
  end

end
