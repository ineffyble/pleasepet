class AddAttachmentSoundToNoises < ActiveRecord::Migration
  def self.up
    change_table :noises do |t|
      t.attachment :sound
    end
  end

  def self.down
    remove_attachment :noises, :sound
  end
end
