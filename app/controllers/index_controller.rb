class IndexController < ApplicationController
  def view
    @stats = {}
    @stats[:total_pets] = Pet.all.count
    @stats[:total_pettings] = Pet.sum(:received_pettings_count)
  end

  def naptime
  end
end
