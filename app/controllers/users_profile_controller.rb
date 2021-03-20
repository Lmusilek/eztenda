class UsersProfileController < ApplicationController
  def index
    @venues = Venue.all
    @bids = Bid.all
    @drinksopportunities = DrinksOpportunity.all
  end
end
