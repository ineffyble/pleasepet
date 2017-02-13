class AddPageToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :page_id, :integer
  end
end
