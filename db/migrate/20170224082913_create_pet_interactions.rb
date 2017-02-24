class CreatePetInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_interactions do |t|
      t.integer :petter_id
      t.integer :petted_id
      t.integer :total_pettings
      t.datetime :first_petting
      t.datetime :last_petting

      t.timestamps
    end
  end
end
