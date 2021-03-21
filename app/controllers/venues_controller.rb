class VenuesController < ApplicationController
  def index
    @query = params[:query]
    if not @query or @query.empty?
      @venues = Venue.all
      return
    end
    #@venues = Venue.search(params[:query])
    # @venues = Venue.select { |venue| venue.drinks_opportunities.drink_id.include?(Drink.find_by(name: params[:query])) }
    @drinks = Drink.where("name ILIKE ?", "%#{params[:query]}%")

    @venues = []

    Venue.all.each do |venue|
      venue.drinks_opportunities.each do |opportunity|
           @drinks.each do |drink|
            if opportunity.drink_id == drink.id
                @venues << venue
            end
          end
      end
    end

    if @venues.empty?
      @venues = Venue.all
    end
end

  def show
    @bid = Bid.new
    @venue = Venue.find(params[:id])
      @markers = [
        {
          lat: @venue.latitude,
          lng: @venue.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { venue: @venue })
        }
      ]
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
    params.require(:venue).permit(:venue_name, :description, :region, :city, :post_code, :photo)
  end
end
