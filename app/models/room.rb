
class Room < ApplicationRecord
  belongs_to :owner
  belongs_to :hotel
  has_many :reservations
  has_many :room_facilities
  has_many :facilities, through: :room_facilities, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :room_name
    validates :capacity
    validates :price
    validates :owner_id
    validates :hotel_id
  end
end
