class CreatePettings < ActiveRecord::Migration[5.0]
  def change
    create_table :pettings do |t|
      t.integer :petter_id
      t.integer :petted_id
      t.datetime :petted_at

      t.timestamps
    end
  end
end
