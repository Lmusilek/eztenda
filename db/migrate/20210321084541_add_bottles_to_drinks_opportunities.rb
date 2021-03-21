class AddBottlesToDrinksOpportunities < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks_opportunities, :bottle_type, :string
  end
end
