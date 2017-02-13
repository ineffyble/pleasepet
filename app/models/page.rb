class Page < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  belongs_to :pet, inverse_of: :page

  def to_param
    url
  end
end
