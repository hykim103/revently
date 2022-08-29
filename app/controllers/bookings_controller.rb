class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date)
  end
end
