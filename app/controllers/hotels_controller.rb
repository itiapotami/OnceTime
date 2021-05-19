class HotelsController < ApplicationController
  def index

  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to hotels_path
    else
      render :new
    end
  end

  private
  def hotel_params
    params.require(:hotel).permit(:hotel_name, :description, :postal_code, :prefecture_id, :city, :house_number, :building_number, :image).merge(owner_id: current_owner.id)
  end
end
