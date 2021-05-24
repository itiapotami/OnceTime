class Facility < ApplicationRecord
  has_many :room_facilities
  has_many :rooms, through: :room_facilities
  has_many :hotels
end
