class Room < ApplicationRecord
  belongs_to :owner
  belongs_to :hotel
  has_many :reservations
  has_many :room_facilities
  has_many :facilities, through: :room_facilities
  has_one_attached :image
end
