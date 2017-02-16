class CreateNoises < ActiveRecord::Migration[5.0]
  def change
    create_table :noises do |t|
      t.integer :page_id

      t.timestamps
    end
  end
end
