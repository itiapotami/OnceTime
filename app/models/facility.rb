class Facility < ApplicationRecord
  has_many :room_facilities
  #has_many :hotels, through: :room_haves
  has_many :rooms, through: :room_facilities
  
end
