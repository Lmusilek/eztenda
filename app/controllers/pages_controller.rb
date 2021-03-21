class PagesController < ApplicationController
  def home
    @venues = Venue.all.sample(3)
  end
end
