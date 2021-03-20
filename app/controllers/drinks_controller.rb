class DrinksController < ApplicationController

  # CREATE
  def create
    @venue = Venue.find(params[:venue_id])
    @drink = Drink.new(drinks_params)
    @drink.venue = @drink
    @drink.save
  end

  # DESTROY
  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
  end

  private

  def drinks_params
    params.require(:drinks).permit(:name)
  end
end
