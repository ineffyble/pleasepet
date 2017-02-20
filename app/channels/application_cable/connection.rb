module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_pet

   def connect
     self.current_pet = find_verified_pet
   end

   protected

   def find_verified_pet
     if verified_pet = env['warden'].user
       verified_pet
     else
       false
     end
   end

  end
end
