class RoomHave < ApplicationRecord
  belongs_to :room
  belongs_to :facility
end
