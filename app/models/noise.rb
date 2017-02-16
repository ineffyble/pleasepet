class Noise < ApplicationRecord
  belongs_to :page, inverse_of: :noises

  has_attached_file :sound
  do_not_validate_attachment_file_type :sound
end
