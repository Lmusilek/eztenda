class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @drink_opportunity = DrinksOpportunity.find(params[:drinks_opportunity_id])
    @bid = Bid.new
  end

  def create
    @drink_opportunity = DrinksOpportunity.find(params[:drinks_opportunity_id])
    @bid = Bid.new(bid_params)
    @bid.user_id = current_user.id
    @bid.drinks_opportunity_id = @drink_opportunity.id
    if @bid.save
      redirect_to venue_path(@drink_opportunity.venue.id), notice: "The bid was created with success."
    else
      raise
      render :new
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to bid_path(@bid)
    else
      render :edit
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to bid_path
  end

  private

  # PARAMS

  def bid_params
    params.require(:bid).permit(:contract, :price, :notes)
  end
end
