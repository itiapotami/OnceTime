class Facility < ApplicationRecord
  has_many :room_haves
  has_many :rooms, through: :room_haves
  has_many :hotels
end
