class Noise < ApplicationRecord
  belongs_to :page, inverse_of: :noises

  has_attached_file :sound
  validates_attachment_content_type :sound,
                                    :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
