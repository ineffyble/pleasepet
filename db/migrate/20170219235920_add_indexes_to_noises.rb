class AddIndexesToNoises < ActiveRecord::Migration[5.0]
  def change
    add_index :noises, :page_id
  end
end
