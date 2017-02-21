class Petting < ApplicationRecord
  belongs_to  :petter,
              class_name: 'Pet',
              inverse_of: :performed_pettings,
              counter_cache: :performed_pettings_count

  belongs_to  :petted,
              class_name: 'Pet',
              inverse_of: :received_pettings,
              counter_cache: :received_pettings_count
end
