class ChangeUsernameToUrl < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :username, :url
  end
end
