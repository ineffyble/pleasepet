class AddNameToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :name, :string
  end
end
