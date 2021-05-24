class Room < ApplicationRecord
  belongs_to :owner
  belongs_to :hotel
  has_many :reservations
  has_many :room_haves
  has_many :facilities, through: :room_haves
  has_one_attached :image
end
