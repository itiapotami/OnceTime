class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image )
  end
end
