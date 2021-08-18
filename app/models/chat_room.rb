class ChatRoom < ApplicationRecord
  belongs_to :hotel
  has_many :chat_messages
end
