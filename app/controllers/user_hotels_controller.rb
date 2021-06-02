class UserHotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = Room.where(hotel_id: @hotel.id)
  end
end
