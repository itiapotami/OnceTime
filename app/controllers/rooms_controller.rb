class RoomsController < ApplicationController
 
  
  def new
      @hotel = Hotel.find(params[:hotel_id])
      @room = Room.new
  
  end

  def create
      @hotel = Hotel.find(params[:hotel_id])
      @room = Room.new(room_params)
      if @room.save
        redirect_to hotel_path(@hotel.id)
      else
        render :new
      end
  end

  

  private
  def room_params
    params.require(:room).permit(:room_name, :capacity, :price, :image, facility_ids: []).merge(owner_id: current_owner.id, hotel_id: params[:hotel_id])
  end
  
end
