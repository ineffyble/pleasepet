class AddShowPettersToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :show_petters, :integer, :default => 0, :null => false
  end
end
