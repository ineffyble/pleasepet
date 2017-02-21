class AddUrlIndexToPage < ActiveRecord::Migration[5.0]
  def change
    add_index :pages, :url
  end
end
