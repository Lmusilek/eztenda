class AddDrinksOpportunityToBids < ActiveRecord::Migration[6.0]
  def change
    add_reference :bids, :drinks_opportunity, foreign_key: true
  end
end
