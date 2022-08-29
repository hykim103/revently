class BookingsController < ApplicationController
  def create
    @booking = Restaurant.new(booking_params)
    @booking.save
  end

  def destroy
    
  end
end
