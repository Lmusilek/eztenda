class BidsController < ApplicationController
  def index
    @bids = Bids.all
  end

  def show
    @bid = Bids.find(params[:id])
  end

  def new
    @bid = Bids.new
  end

  def create
    @bid = bid.new(bid_params)
    if @bid.save
      redirect_to bid_path(@bid)
    else
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
