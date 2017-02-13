class AddAttachmentBackgroundToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :pages, :background
  end
end
