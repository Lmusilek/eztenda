class RemoveBidFromDrinksOpportunity < ActiveRecord::Migration[6.0]
  def change
    remove_reference :drinks_opportunities, :bid, index: true, foreign_key: true
  end
end
