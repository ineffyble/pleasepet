class AddAllowAnonPettingToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :allow_anon_petting, :boolean, null: false, default: false
  end
end
