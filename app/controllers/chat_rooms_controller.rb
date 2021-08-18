class ChatRoomsController < ApplicationController
  
  def create
    chat_room = ChatRoom.find_by(hotel_id: params[:hotel_id])
    if chat_room.blank?
      chat_room = ChatRoom.create(hotel_id: params[:hotel_id])
    end
    redirect_to chat_room_path(id: chat_room.id)
  end
  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_messages = ChatMessage.where(chat_room: @chat_room.id)
    @chat_message = ChatMessage.new
  end
end
