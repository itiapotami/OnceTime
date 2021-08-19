class ChatRoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]
  before_action :have_reservation, only: [:create, :show]

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

  private
    def have_reservation
      if Reservation.where(user_id: current_user).blank?
        redirect_to user_hotel_path(id: params[:hotel_id])
      end
    end
end
