class ReservationsController < ApplicationController
  def user_bookings
    @reservations = Reservation.where(user: current_user)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:booking).permit(:booking_date)
  end
end
