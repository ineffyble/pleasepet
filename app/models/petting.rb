class Petting < ApplicationRecord
  belongs_to :petter,
    class_name: 'Pet',
    inverse_of: :performed_pettings
  belongs_to :petted,
    class_name: 'Pet',
    inverse_of: :received_pettings
end
