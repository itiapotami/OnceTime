class Hotel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :owner
  has_many   :rooms
  has_one    :chat_room
  
  has_one_attached :image

  with_options presence: true do
    validates :hotel_name
    validates :description
    validates :country
    validates :city
    validates :house_number
  end
end
