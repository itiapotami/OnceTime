class ReservationsController < ApplicationController

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to user_hotels_path
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person, :last_name, :first_name, :last_kana, :first_kana, :phone_number).merge(user_id: current_user.id, room_id: @room.id)
  end
end
