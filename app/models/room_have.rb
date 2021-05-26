class RoomHave < ApplicationRecord
  belongs_to :room
  belongs_to :facility
  #belongs_to :hotel
end
