class ChangeurlToUrl < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :url, :url
  end
end
