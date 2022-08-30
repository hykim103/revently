class MenuController < ApplicationController
  def create
    @menu = Menu.new(menu_params)
    @menu.save
  end

  def edit
  end

  def update
    @menu.update(menu_params)
  end

  def destroy
    @menu.destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :category, :price)
  end
end
