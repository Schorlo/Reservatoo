class ReservationsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all.where(user_id: @user.id)
    @restaurant_reservation_path
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservations_params)
    @reservation.restaurant = @restaurant
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_reservations_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_reservations_path
  end

  private

  def reservations_params

    params.require(:reservation).permit(:datetime, :user, :comment, :restaurant)

  end
end


  # private

  # def reservation_params
  #   params.require(:reservation).permit(:comment, :datetime, :seats)
  # end

