class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.integer :pet_id
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
