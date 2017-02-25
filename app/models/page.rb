class Page < ApplicationRecord
  VALID_URL_REGEX = /\A[_\-a-zA-Z0-9]+\z/
  validates :url, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_URL_REGEX }

  validates :text_color, allow_blank: true, css_hex_color: true

  belongs_to :pet, inverse_of: :page
  has_many :noises, inverse_of: :page

  has_attached_file :background
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :noises, reject_if: :all_blank, allow_destroy: true

  before_save { self.url = url.downcase }

  def to_param
    url.downcase
  end

  after_create do
    if ENV["SLACK_WEBHOOK_URL"]
      notifier = Slack::Notifier.new ENV["SLACK_WEBHOOK_URL"]
      notifier.ping self.pet.name + " <" + self.pet.email + "> - /" + self.url
    end
  end
end
