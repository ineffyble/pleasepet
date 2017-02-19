class IndexController < ApplicationController
  def view
    @stats = {}
    @stats[:total_pets] = Pet.all.count
    @stats[:total_pettings] = Petting.all.count
  end
end
