class AddTextColorToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :text_color, :string
  end
end
