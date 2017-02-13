class Page < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  belongs_to :pet, inverse_of: :page

  has_attached_file :background
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

  def to_param
    url
  end
end
