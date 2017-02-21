class AddReceivedPettingsCountToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :received_pettings_count, :integer
  end
end
