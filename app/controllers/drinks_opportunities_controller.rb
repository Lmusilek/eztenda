class DrinksOpportunitiesController < ApplicationController
  # INDEX

  def index
    @drinks_opportunities = DrinkOpportunity.all
  end

  # SHOW

  def show
    @drinks_opportunities = DrinkOpportunity.find(params[:id])
  end

  # NEW

  def new
    @drink_opportunity = DrinkOpportunity.new
  end

  # EDIT

  def edit
     @drink_opportunity = DrinkOpportunity.find(params[:id])
  end

  # UPDATE

  def update
    @drink_opportunity = DrinkOpportunity.find(params[:id])
      if @drink_opportunity.update(drinks_opportunities_params)
        redirect_to drink_opportunity(@drink_opportunity)
      else
        render :edit
      end
   end

  # CREATE

  def create
    @drink_opportunity = DrinkOpportunity.new(drinks_opportunities_params)
    @drink_opportunity.user = current_user
    if @drink_opportunity.save
      redirect_to drink_opportunity(@drink_opportunity)
      else
        render :new
      end
   end

  # DESTROY

  def destroy
    @drink_opportunity = DrinkOpportunity.find(params[:id])
    @drink_opportunity.destroy
    redirect_to venues_path
  end

 private

  def drinks_opportunities_params
    params.require(:drink_opportunity).permit(:bid_id, :quantity, :start_time, :end_time, :drink_id)
  end
end
