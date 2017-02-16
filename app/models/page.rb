class Page < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  belongs_to :pet, inverse_of: :page
  has_many :noises, inverse_of: :page

  has_attached_file :background
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :noises, reject_if: :all_blank, allow_destroy: :rue

  def to_param
    url
  end
end
