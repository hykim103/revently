class ReservationsController < ApplicationController
  def user_bookings
    @reservations = Reservation.where(user_id: current_user)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.restaurant = @restaurant
    @reservation.user = current_user
    if @reservation.save!
      redirect_to restaurants_path
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booking)
  end
end
