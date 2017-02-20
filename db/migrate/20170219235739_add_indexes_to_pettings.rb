class AddIndexesToPettings < ActiveRecord::Migration[5.0]
  def change
    add_index :pettings, :petter_id
    add_index :pettings, :petted_id
  end
end
