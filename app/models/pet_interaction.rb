class PetInteraction < ApplicationRecord
  belongs_to  :petter,
              class_name: 'Pet',
              inverse_of: :performed_pettings,
              optional: true

  belongs_to  :petted,
              class_name: 'Pet',
              inverse_of: :received_pettings

  delegate :name, :page_url, :to => :petter, :prefix => true
  delegate :name, :page_url, :to => :petted, :prefix => true
end
