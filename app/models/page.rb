class Page < ApplicationRecord
  VALID_URL_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :url, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_URL_REGEX }
  belongs_to :pet, inverse_of: :page
  has_many :noises, inverse_of: :page

  has_attached_file :background
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :noises, reject_if: :all_blank, allow_destroy: :rue

  before_save { self.url = self.url.downcase! }

  def to_param
    url.downcase
  end
end
