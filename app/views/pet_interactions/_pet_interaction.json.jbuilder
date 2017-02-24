json.extract! pet_interaction, :id, :petter_id, :petted_id, :total_pettings, :first_petting, :last_petting, :created_at, :updated_at
json.url pet_interaction_url(pet_interaction, format: :json)