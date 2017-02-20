class PageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "page_channel_#{params[:url]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
