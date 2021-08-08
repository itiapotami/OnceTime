class ChatRoomsController < ApplicationController
  
  def create
    chat_room = ChatRoom.where(hotel_id: params[:hotel_id])
    if chat_room.blank?
      chat_room = ChatRoom.create(hotel_id: params[:hotel_id])
      redirect_to action: :show, id: chat_room.id
    else
      redirect_to action: :show, id: chat_room.id
    end
  end
  def show
    
  end
end
