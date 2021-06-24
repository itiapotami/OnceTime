class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :image )
  end
end
