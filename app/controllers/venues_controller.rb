class VenuesController < ApplicationController
  def index
    @venues = Venues.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = venue.new(venue_params)
    if @event.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venue_path
  end

  private

  # PARAMS

  def venue_params
    params.require(:venue).permit(:venue_name, :description, :region, :city, :post_code)
  end
end
