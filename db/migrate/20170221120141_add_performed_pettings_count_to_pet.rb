class AddPerformedPettingsCountToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :performed_pettings_count, :integer
  end
end
