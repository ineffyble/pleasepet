class AddIndexesToPages < ActiveRecord::Migration[5.0]
  def change
    add_index :pages, :pet_id
  end
end
