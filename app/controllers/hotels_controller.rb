class HotelsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :show, :edit, :update]
  before_action :hotel_get, only: [:show, :edit, :update]
  
  def index
    @hotels = Hotel.where(owner_id: current_owner.id) if owner_signed_in?
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

  def show
    @rooms = Room.where(hotel_id: @hotel.id)
  end

  def edit
    
  end

  def update
    @hotel.update(hotel_params)
    if @hotel.save
      redirect_to hotels_path
    else
      render :edit
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :description, :postal_code, :prefecture_id, :city, :house_number,
                                  :building_number, :image).merge(owner_id: current_owner.id)
  end

  def hotel_get
    @hotel = Hotel.find(params[:id])
  end
end
