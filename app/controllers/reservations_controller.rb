class ReservationsController < ApplicationController
  def index
    @hotels = Hotel.all
  end
end
