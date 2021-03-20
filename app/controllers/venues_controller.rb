class VenuesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "venue_name ILIKE :query OR synopsis ILIKE :query"
      @venues = Venue.where("venue_name ILIKE ?", "%#{params[:query]}%")
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue), notice: "The venue was created with success."
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
    redirect_to venues_path
  end

  private

  # PARAMS

  def venue_params
    params.require(:venue).permit(:venue_name, :description, :region, :city, :post_code)
  end
end
