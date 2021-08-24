class ChatMessagesController < ApplicationController
  
  def create
    @chat_message = ChatMessage.new(chat_message_params)
    if @chat_message.save
      ActionCable.server.broadcast 'chat_room_channel', content: @chat_message, user: current_user
      #redirect_to chat_room_path(id: @chat_message.chat_room_id)
    end
  end

  private
  def chat_message_params
    params.require(:chat_message).permit(:content).merge(user_id: current_user.id, chat_room_id: params[:chat_room_id])
  end
end
