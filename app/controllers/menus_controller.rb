class MenusController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new(menu_params)
    @menu.restaurant = @restaurant
    if @menu.save
      redirect_to new_restaurant_menu_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @menu.update(menu_params)
  end

  def destroy
    @menu.find(params[:id])
    @menu.destroy status: :see_other
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :category, :price, :photo)
  end
end
