class PageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "page_channel_#{params[:url]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def pet
    if !current_pet
      if Petting.where("petted_at >= :date", :date => 1.minute.ago).count > 450
        reject_unauthorized_connection
      end
    end
    params[:url].downcase!
    @page = Page.find_by! url: params[:url]
    petting_params = {
      petted_id: @page.pet_id,
      petted_at: DateTime.now.utc
    }
    if current_pet
      petting_params[:petter_id] = current_pet.id
    end
    @petting = Petting.new(petting_params)
    if @petting.save
      petter = @petting.petter
      ActionCable.server.broadcast "page_channel_#{@page.url}",
        petter: petter ? { name: petter.name, url: petter.page.url } : false,
        petted_at: @petting.petted_at,
        pet_count: @page.pet.received_pettings.count
    end
  end
end
