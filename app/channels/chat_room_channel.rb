class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from ""
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  
end