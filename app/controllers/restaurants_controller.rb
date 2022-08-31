class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
        image_url: helpers.asset_url("Revently-logo.png")
      }
    end
  end

  def show
    authenticate_user!
    @marker = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      info_window: render_to_string(partial: "info_window", locals: { restaurant: @restaurant })
    }]
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
  end

  def destroy
    @restaurant.destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :cuisine, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
